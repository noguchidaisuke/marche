class RestaurantsController < ApplicationController
  def new
    @zoom = 16
    url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'
    freeword = params[:freeword].presence
    area = params[:area]
    latitude, longitude = params[:latlng].scan(/[0-9]+.[0-9]+/)
    query = {
      keyid: ENV['GURUNAVI_API_KEY'],
      hit_per_page: 30
    }
    if area == "現在地"
      query.merge!(current_point(latitude,longitude))
      @zoom = 18
    elsif area.present?
      freeword += ',' + area
    end
    
    query.merge!({freeword: freeword})
    response = Faraday.get(url, query)
    response_json = JSON.parse(response.body)
    begin
      restaurants = restaurants_factory(response_json)
      @restaurants = Kaminari.paginate_array(restaurants).page(params[:page]).per(10)
      @centerlat = @restaurants.first.latitude
      @centerlong = @restaurants.first.longitude
    rescue => e
      logger.error e.message
      flash[:danger] = '該当のお店が見つかりませんでした。他のキーワードでお願いします'
      redirect_to root_path
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @latlng = [@restaurant[:latitude], @restaurant[:longitude]]
    @comment = @restaurant.comments.new
    @comments = @restaurant.comments.with_attached_images.includes(:user).order(created_at: :DESC)
    @comment_images = @comments.select{ |comment| comment.images.attached? }
    @avg_comment_rating = @comments.average(:rating)&.round(1) || 0
  end

  private
  def current_point(latitude,longitude)
    if latitude.nil?
      flash[:danger] = "現在地を取得できませんでした。もう一度お願いします。"
      redirect_back(fallback_location: root_path)
    else
      { latitude: latitude, longitude: longitude }
    end
  end

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
      tel: rest['tel'],
      pr_long: rest['pr']['pr_long'],
      category: rest['category'] ,
      station: rest['access']['station']
    }
  end

  def restaurants_factory(response_json)
    empty_box = []
    response_json['rest'].each do |rest|
      hash = make_hash(rest)
      restaurant = Restaurant.find_by(g_id: hash[:g_id]) || Restaurant.create(hash)  #なぜかf_or_c_by使えない、、、
      restaurant.shop_image1 = 'https://ximg.retty.me/crop/s172x172/-/retty_main/images/noimg_200_150.png' if restaurant.shop_image1.empty?
      empty_box << restaurant
    end
    empty_box.to_ary
  end
end