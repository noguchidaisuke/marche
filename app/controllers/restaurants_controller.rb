class RestaurantsController < ApplicationController
  def new

    @restaurants = []
   
    @freeword = params[:freeword]
    
    url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'

    params = {
      keyid: '4cd1a81fec528e1c5fc0dfa8ca16e7a2',
      freeword: @freeword
    }
    
    conn = Faraday.new(url: url)
    response = conn.get '', params
    #response_jsonにjsonの形でparamsのリクエストに応じたレスポンスが帰ってくる
    response_json = JSON.parse(response.body) 
    if response_json.present?
      response_json['rest'].each do |rest| 
        restaurant = Restaurant.new(read(rest))
        restaurant.save
        @restaurants << restaurant
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