class PostSerializer < ActiveModel::Serializer
  attributes :id, :header, :content, :keyword, :user, :created_at, :updated_at
  has_one :user
  has_many :comments
  has_many :likes

  private

  def user
    {id:object.user.id, username: object.user.username, avatar: Rails.application.routes.url_helpers.rails_blob_path(object.user.avatar, only_path: true)}
    # ActiveModel::SerializableResource.new(object.user,  serializer: UserSerializer)
  end
end
