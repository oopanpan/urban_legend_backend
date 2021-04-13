class PostSerializer < ActiveModel::Serializer
  attributes :id, :header, :content, :keyword
  has_one :user
  has_many :commentable
end
