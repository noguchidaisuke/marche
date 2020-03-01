class User < ApplicationRecord
  before_save { self.email.downcase! }
  has_one_attached :avatar
  validates :name, presence: true, length: { minimum: 3, maximum: 10 }
  validates :email, presence: true, length: { maximum: 50 },uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 4 }
  validates :profile, length: { maximum: 200 }
  has_secure_password

  has_many :likes
  has_many :restaurants, through: :likes
  has_many :like_restaurants, through: :likes, source: :restaurant
  has_many :comments
  has_many :relationships
  has_many :followings,through: :relationships,source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    self.relationships.find_or_create_by(follow_id:other_user[:id]) unless self == other_user
  end

  def unfollow(other_user)
    self.relationships.find_by(follow_id: other_user[:id]).destroy unless self == other_user
  end

  def following?(other_user)
    self.followings.include?(other_user) unless self == other_user
  end

  def like(restaurant)
    likes.find_or_create_by(restaurant_id: restaurant.id)
  end

  def unlike(restaurant)
    likes.find_by(restaurant_id: restaurant.id).destroy
  end

  def like?(restaurant)
    like_restaurants.include?(restaurant)
  end

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    image = auth[:info][:image]

    self.find_or_create_by(provider: provider,uid: uid) do |user|
      user.email = 'aiueo@gmail.com'
      user.password = 'aiueo12345'
      user.name = name
      user.image = image
    end
  end
end
