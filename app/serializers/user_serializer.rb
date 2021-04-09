class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email_address, :bio, :keyword, :admin
end
