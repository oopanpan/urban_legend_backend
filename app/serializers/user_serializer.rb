class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email_address, :bio, :keyword, :liked_posts, :avatar, :friendships, :inverse_friendships
  has_many :posts

  def avatar
    url = object.avatar.url
    # Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true)
    url
  end

  def friendships
    altered_friends = []
    object.friendships.each do |friendship|
      custom_friend = {}
      custom_friend[:id] = friendship.id
      custom_friend[:following_id] = friendship.friend.id
      custom_friend[:username] = friendship.friend.username
      if friendship.friend.avatar.attached?
        custom_friend[:avatar] = Rails.application.routes.url_helpers.rails_blob_path(friendship.friend.avatar, only_path: true)
      end
      altered_friends.push(custom_friend)
    end
    return altered_friends
  end

  def inverse_friendships
    altered_friends = []
    object.inverse_friendships.each do |friendship|
      custom_friend = {}
      custom_friend[:id] = friendship.id
      custom_friend[:follower_id] = friendship.user.id
      custom_friend[:username] = friendship.user.username
      if friendship.user.avatar.attached?
        custom_friend[:avatar] = Rails.application.routes.url_helpers.rails_blob_path(friendship.friend.avatar, only_path: true)
      end
      altered_friends.push(custom_friend)
    end
    return altered_friends
  end


end
