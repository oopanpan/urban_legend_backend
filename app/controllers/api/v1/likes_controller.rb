class Api::V1::LikesController < ApplicationController

    def create
        like = Like.create(like_params)
        render json: like
    end

    def destroy
        like = Like.find(params[:id])
        like.destroy
        render json: {message: 'unliked'}
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end
end