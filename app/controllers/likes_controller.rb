class LikesController < ApplicationController
  def create
    @restaurant = Restaurant.find_or_initialize_by(g_id:params[:restaurant_g_id])
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
