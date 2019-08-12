class ToppagesController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
end
