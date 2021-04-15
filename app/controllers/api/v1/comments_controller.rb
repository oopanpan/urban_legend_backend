class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized, only: :show
    
    def create
        comment = Comment.create(comment_params)
        render json: comment
    end

    def show
        comment = Comment.find(params[:id])
        render json: comment
    end

    def update
        comment = Comment.find(params[:id])
        comment.update(comment_params)
        render json: comment
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: {message: 'comment deleted'}, status: :accepted
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :content, :commentable_type, :commentable_id, :keyword)
    end
end
