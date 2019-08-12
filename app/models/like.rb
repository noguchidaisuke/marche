class Like < ApplicationRecord
  
  belongs_to :user
  belongs_to :restaurant
  
  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  
  def self.ranking
    self.group(:restaurant_id).order('count_restaurant_id DESC').limit(10).count(:restaurant_id)
  end
  
end
