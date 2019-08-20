class RestaurantsController < ApplicationController
  def new

    @restaurants = []
   
    @freeword = params[:freeword]
    
    url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'

    params = {
      keyid: ENV['GURUNAVI_API_KEY'],
      freeword: @freeword
    }
    
    conn = Faraday.new(url: url)
    response = conn.get '', params
    #response_jsonにjsonの形でparamsのリクエストに応じたレスポンスが帰ってくる
    response_json = JSON.parse(response.body) 
    if response_json.present?
      begin
        response_json['rest'].each do |rest| 
          restaurant = Restaurant.new(read(rest))
          if Restaurant.find_by(g_id: restaurant[:g_id])
            restaurant = Restaurant.find_by(g_id: restaurant[:g_id])
          else
            restaurant.save 
          end
          @restaurants << restaurant
        end
      rescue
        flash[:danger]='該当のお店が見つかりませんでした。他のキーワードでお願いします'
        redirect_to root_path
      end
    end
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    @latlng = Array[@restaurant[:latitude],@restaurant[:longitude]]
    @comment = @restaurant.comments.new
    @like_users = @restaurant.like_users
  end
  
end