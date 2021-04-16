class Api::V1::PostsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    
    def index
        # byebug
        items = params[:limit].to_i
        page = (params[:page].to_i-1)*items
        total_pages = Post.all.count/items +1
        posts = Post.order(updated_at: :desc).limit(items).offset(page)
        # byebug
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
