class Api::V1::FriendshipssController < ApplicationController 

    def create
        friendship = Friendship.new
        friendship.user_id = params[:user_id]
        friendship.friend_id = params[:friend_id]
        if friendship.save
            render json: {message: 'sucess'}
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