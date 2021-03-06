class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :commented_posts, through: :comments, source: :commentable, source_type: 'Post'
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post
    has_one_attached :avatar, dependent: :destroy

    has_many :friendships
    has_many :friends, through: :friendships
    has_many :inverse_friendships, foreign_key: :friend_id, class_name: 'Friendship'
    has_many :inverse_friends, through: :inverse_friendships, source: :user
    
    validates :email_address, uniqueness: true, on: :create
    validates :username, uniqueness: true


    has_secure_password

end
