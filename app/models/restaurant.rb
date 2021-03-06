class Restaurant < ApplicationRecord
  validates :name, length: { maximum: 255 }
  validates :url, length: { maximum: 255 }
  validates :shop_image1, length: { maximum: 255 }
  validates :pc, length: { maximum: 255 }
  validates :pr_short, length: { maximum: 255 }
  validates :g_id, presence: true, length: { maximum: 20 }

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  def avg_rating
    self.comments.average(:rating)&.round(1) || 3
  end
end