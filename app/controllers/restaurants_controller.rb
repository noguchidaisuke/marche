class RestaurantsController < ApplicationController
  def new
    restaurants,@latitude,@longitude = [],[],[]
    @zoom = 13
    url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'
    freeword = params[:freeword] unless params[:freeword] == ""
    query = {
      keyid: ENV['GURUNAVI_API_KEY'],
      hit_per_page: 30
    }
    
    if params[:area] == "現在地"
      latitude,longitude=params[:latlng].scan(/[0-9]+.[0-9]+/)
      if latitude.nil?
        flash[:danger]="現在地を取得してください"
        redirect_back(fallback_location: root_path)
      end
      current_point={latitude: latitude,longitude: longitude}
      query.merge!(current_point)
      @zoom = 17
    elsif params[:area].present?
      freeword+= ',' + params[:area]
    end
    
    query.merge!({freeword: freeword})
    response = Faraday.get(url,query)
    response_json = JSON.parse(response.body)
    
    if response_json.present?
      begin
        response_json['rest'].each do |rest|
          restaurant=Restaurant.find_or_create_by(make_hash(rest))
          restaurant.shop_image1 = 'https://upload.wikimedia.org/wikipedia/ja/b/b5/Noimage_image.png' if restaurant.shop_image1.empty?
          restaurants << restaurant
        end
        restaurants=restaurants.to_ary
        @restaurants = Kaminari.paginate_array(restaurants,total_count: restaurants.count).page(params[:page]).per(10)
        @centerlat = @restaurants.last.latitude
        @centerlong = @restaurants.last.longitude
      rescue
        flash[:danger]='該当のお店が見つかりませんでした。他のキーワードでお願いします'
        redirect_to root_path
      end
    end
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    @latlng = [@restaurant[:latitude],@restaurant[:longitude]]
    @comment = @restaurant.comments.new
    @comments = @restaurant.comments.with_attached_images.includes(:user).order('rating DESC')
    @comments.average(:rating)? @avg_comment_rating = @comments.average(:rating).round(1) : @avg_comment_rating = 0
  end
  
  private

  def make_hash(rest)
    {
      g_id: rest['id'],
      name: rest['name'],
      url: rest['url'],
      shop_image1: rest['image_url']['shop_image1'],
      pc: rest['coupon_url']['pc'],
      pr_short: rest['pr']['pr_short'],
      latitude: rest['latitude'],
      longitude: rest['longitude'],
      tel: rest['tel']
    }
 end
end