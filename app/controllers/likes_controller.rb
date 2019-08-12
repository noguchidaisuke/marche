class LikesController < ApplicationController
  def create
    @restaurant = Restaurant.find_or_initialize_by(g_id:params[:restaurant_g_id])
    
    unless @restaurant.persisted?
      
      url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'
      
      serch = {
        keyid: '4cd1a81fec528e1c5fc0dfa8ca16e7a2',
        id: @restaurant[:g_id]

      }

      conn = Faraday.new(url: url)
      res = conn.get '', serch
      response_json = JSON.parse(res.body)
      rest = response_json['rest'][0]
      @restaurant = Restaurant.new(read(rest))
      @restaurant.save
    end
    
    current_user.like(@restaurant)
    flash[:success]="お気に入り登録しました"
    redirect_back(fallback_location: root_path)
  end
    
  

  def destroy
    
    @restaurant = Restaurant.find(params[:id])
    
    current_user.unlike(@restaurant)
    flash[:success] = 'お気に入りを外ました。'
  
    redirect_back(fallback_location: root_path)
  end

end
