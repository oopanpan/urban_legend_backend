class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :commented_posts, through: :comments, source: :post
    has_many :likes
    has_many :liked_posts, through: :likes, source: :post

    has_secure_password
end
