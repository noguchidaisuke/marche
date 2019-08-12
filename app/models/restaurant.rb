class Restaurant < ApplicationRecord
  validates :name,  length: { maximum: 255 }
  validates :url,  length: { maximum: 255 }
  validates :shop_image1,  length: { maximum: 255 }
  validates :pc,  length: { maximum: 255 }
  validates :pr_short,  length: { maximum: 255}
  validates :g_id,  length: { maximum: 255 }
  
  has_many :likes
  has_many :users, through: :likes
  has_many :like_users, through: :likes, source: :user

end