class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes,
  has_many :liked_user, through: :likes, source: :user
end
