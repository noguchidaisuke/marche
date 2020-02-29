class Like < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  class << self
    define_method :ranking do
      group(:restaurant_id).order('count_restaurant_id DESC').limit(10).count(:restaurant_id)
    end
  end
end