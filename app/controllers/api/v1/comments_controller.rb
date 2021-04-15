class Api::V1::CommentsController < ApplicationController
    
    def create
        comment = Comment.create(comment_params)
        render json: comment
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :content, :commentable_type, :commentable_id, :keyword)
    end
end
