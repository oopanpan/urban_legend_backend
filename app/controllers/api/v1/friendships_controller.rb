class Api::V1::FriendshipsController < ApplicationController 

    def create
        friendship = Friendship.new
        user = User.find(params[:user_id])
        friend = User.find(params[:friend_id])
        friendship.user = user
        friendship.friend = friend
        if friendship.save
            render json: friendship
        else
            render json: {message: 'fail'}
        end
    end

    def destroy
        friendship = Friendship.find(params[:id])
        friendship.destroy
        render json: {message: 'success'}
    end
end