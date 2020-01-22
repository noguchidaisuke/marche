class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :comment, length: { maximum: 300 }
  validates :rating, presence: true, length: { minimum: 1 }
  has_many_attached :images
end
