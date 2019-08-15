class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  private
  
  def read(rest)
    
     g_id = rest['id']
     name = rest['name']
     url = rest['url']
     shop_image1 = rest['image_url']['shop_image1']
     pc = rest['coupon_url']['pc']
     pr_short = rest['pr']['pr_short']
     latitude = rest['latitude']
     longitude = rest['longitude']
     
     return {
       g_id: g_id,
       name: name,
       url: url,
       shop_image1: shop_image1,
       pc: pc,
       pr_short: pr_short,
       latitude: latitude,
       longitude: longitude
     }
  end
end
