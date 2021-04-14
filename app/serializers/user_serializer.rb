class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email_address, :bio, :keyword, :liked_posts
  has_many :posts
end
