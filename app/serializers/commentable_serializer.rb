class CommentableSerializer < ActiveModel::Serializer
  attributes :id, :content, :comments, :user

  belongs_to :user

  def user
    {id:object.user.id, username: object.user.username}
    # ActiveModel::SerializableResource.new(object.user,  serializer: UserSerializer)
  end
end
