class RestaurantsController < ApplicationController
  def new
    restaurants,@latitude,@longitude = [],[],[]
    url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'
    freeword = params[:freeword] unless params[:freeword] == ""
    query = {
      keyid: ENV['GURUNAVI_API_KEY'],
      hit_per_page: 30
    }
    if params[:area] == ""
      freeword = nil
    elsif params[:area] == "現在地"
      #navbarから現在地と入れられた場合の挙動
      latitude,longitude=params[:latlng].scan(/[0-9]+.[0-9]+/)
      if latitude.nil?
        flash[:danger]="現在地を取得してください"
        redirect_back(fallback_location: root_path)
      end
      current_point={latitude: latitude,longitude: longitude}
      query.merge!(current_point)
    else
      freeword+= ',' + params[:area]
      query[:freeword]=freeword
    end
    query.merge!({freeword: freeword})
    response = Faraday.get(url,query)
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
          restaurants << restaurant
        end
        restaurants=restaurants.to_ary
        @centerlat = restaurants.first.latitude
        @centerlong = restaurants.first.longitude
        @restaurants = Kaminari.paginate_array(restaurants,total_count: restaurants.count).page(1).per(10)
      rescue => e
        flash[:danger]='該当のお店が見つかりませんでした。他のキーワードでお願いします'
        redirect_to root_path
      end
    end
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    @comments =@restaurant.comments
    @latlng = [@restaurant[:latitude],@restaurant[:longitude]]
    @comment = @restaurant.comments.new
  end
end