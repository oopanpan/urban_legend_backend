class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes
  has_many :linked_users, through: :likes, source: :users
end
