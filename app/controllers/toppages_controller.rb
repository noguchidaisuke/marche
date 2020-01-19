class ToppagesController < ApplicationController
  def index
    comments = Comment.includes(:restaurant).find_by_sql("SELECT * FROM comments WHERE(id, restaurant_id, rating) IN ( SELECT max(id), restaurant_id, max(rating) FROM comments group by restaurant_id) ORDER BY rating DESC")
    @restaurants = comments.map {|comment| comment.restaurant}
    @comments = Comment.includes(:restaurant, :user).order('created_at DESC').limit(8).with_attached_images
  end
end