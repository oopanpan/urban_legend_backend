class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :comments, :user
  has_one :user
  has_many :comments

  def user
    {id:object.user.id, username: object.user.username, avatar: Rails.application.routes.url_helpers.rails_blob_path(object.user.avatar, only_path: true)}
    # ActiveModel::SerializableResource.new(object.user,  serializer: UserSerializer)
  end

  # def comment
  #   # object.comments.each do |comment|
  #   #   {content: comment.content, user:{id: comment.user.id, username: comment.user.username}}
  #   # end
  #   ActiveModel::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
  # end
end
