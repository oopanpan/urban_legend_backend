class PostSerializer < ActiveModel::Serializer
  attributes :id, :header, :content, :keyword
  has_one :user
  has_many :comments
end
