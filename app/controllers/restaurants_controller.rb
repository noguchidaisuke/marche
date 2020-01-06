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
      freeword
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
    end
    query.merge!({freeword: freeword})
    response = Faraday.get(url,query)
    response_json = JSON.parse(response.body)
    #response_json['rest'][0]['image_url']['shop_image1'].empty?
    if response_json.present?
      begin
        response_json['rest'].each do |rest|
          restaurant=Restaurant.find_or_create_by(make_hash(rest))
          restaurant.shop_image1 = 'https://upload.wikimedia.org/wikipedia/ja/b/b5/Noimage_image.png' if restaurant.shop_image1.empty?
          restaurants << restaurant
        end
        restaurants=restaurants.to_ary
        @restaurants = Kaminari.paginate_array(restaurants,total_count: restaurants.count).page(params[:page]).per(10)
        @centerlat = @restaurants.first.latitude
        @centerlong = @restaurants.first.longitude
      rescue
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
  def import(rest)
    self.g_id = rest['id']
    self.name = rest['name']
    self.url = rest['url']
    self.shop_image1 = rest['image_url']['shop_image1']
    self.pc = rest['coupon_url']['pc']
    self.pr_short = rest['pr']['pr_short']
    self.latitude = rest['latitude']
    self.longitude = rest['longitude']
    self.tel = rest['tel']
  end
  private
  def make_hash(rest)
    g_id = rest['id']
    name = rest['name']
    url = rest['url']
    shop_image1 = rest['image_url']['shop_image1']
    pc = rest['coupon_url']['pc']
    pr_short = rest['pr']['pr_short']
    latitude = rest['latitude']
    longitude = rest['longitude']
    tel = rest['tel']
    return {
      g_id: g_id,
      name: name,
      url: url,
      shop_image1: shop_image1,
      pc: pc,
      pr_short: pr_short,
      latitude: latitude,
      longitude: longitude,
      tel: tel
    }
 end
end