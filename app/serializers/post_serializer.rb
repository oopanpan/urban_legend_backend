class PostSerializer < ActiveModel::Serializer
  attributes :id, :header, :content, :keyword, :user
  has_one :user
  has_many :comments
  has_many :likes

  def user
    {id:object.user.id, username: object.user.username}
    # ActiveModel::SerializableResource.new(object.user,  serializer: UserSerializer)
  end
end
