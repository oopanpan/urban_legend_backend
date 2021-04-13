class Api::V1::PostsController < ApplicationController
    
    def index
        posts = Post.order(updated_at: :desc).limit(20).offset(params[:index])
        render json: posts
    end

    def show
        post = Post.find(params[:id])
        render json: { post: PostSerializer.new(post) }
    end

    def create
        post = Post.create(posts_params)
        render json: post
    end

    def update
        post = Post.find(params[:id])
        post.update(posts_params)
        render json: post
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: { message: 'Post Deleted'}
    end

    private

    def posts_params
        params.require(:post).permit(:header, :user_id, :header, :content, :keyword)
    end
end
