class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized, only: :show
    
    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: {message: comment.errors.full_messages}
        end
    end

    def show
        comment = Comment.find(params[:id])
        render json: comment
    end

    def update
        comment = Comment.find(params[:id])
        if comment.update(comment_params)
            render json: comment
        else
            render json: {message: 'comment update failed'}
        end
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
