class ToppagesController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
    @tests=Test.all
  end
end
