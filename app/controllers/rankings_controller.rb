class RankingsController < ApplicationController
  def like
    @ranking_counts = Like.ranking
    @restaurants = Restaurant.find(@ranking_counts.keys)
  end
end
