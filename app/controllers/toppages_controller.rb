class ToppagesController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    Test.all.exists? ? @tests=Test.all : @tests = []
  end
end