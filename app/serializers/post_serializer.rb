class PostSerializer < ActiveModel::Serializer
  attributes :id, :header, :content, :keyword
  has_one :user
end
