class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email_address, :bio, :keyword, :liked_posts, :avatar
  has_many :posts

  def avatar
    Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true)
  end
end
