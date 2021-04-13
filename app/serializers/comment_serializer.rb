class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :user
  has_many :commentable
end
