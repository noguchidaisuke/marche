class ToppagesController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end
end
