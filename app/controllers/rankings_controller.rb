class RankingsController < ApplicationController
  def like
    @ranking_counts = Like.ranking
    restaurants = Restaurant.find(@ranking_counts.keys)
    @restaurant=restaurants[0]
    @restaurant2=restaurants[1]
    @restaurant3=restaurants[2]
  end
end