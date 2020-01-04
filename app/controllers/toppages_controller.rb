class ToppagesController < ApplicationController
  def index
    #@restaurants = Restaurant.page(params[:page]).per(9)
    restaurants = Restaurant.all.limit(50)
    restaurants=restaurants.to_ary
    @restaurants=Kaminari.paginate_array(restaurants,total_count: restaurants.count).page(1).per(12)
  end
end