class Api::V1::PostsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show, :total]
    
    def index
        # byebug
        keyword = params[:key]
        items = params[:limit].to_i
        page = (params[:page].to_i)*items
        if keyword == 'global'
            total_pages = Post.all.count/items +1
            @posts = Post.order(updated_at: :desc).limit(items).offset(page)
            render json: { posts: ActiveModel::SerializableResource.new(@posts,  each_serializer: PostSerializer), total_pages: total_pages }
        else
            posts = Post.all.where("keyword LIKE ?", "%#{keyword}%").order(updated_at: :DESC).limit(items).offset(page)
            total_pages = posts.count/items +1
            render json: { posts: ActiveModel::SerializableResource.new(posts,  each_serializer: PostSerializer), total_pages: total_pages }
        end
    end

    def show
        post = Post.find(params[:id])
        render json: { post: PostSerializer.new(post) }
    end

    def create
        post = Post.new(posts_params)
        if post.save
            render json: post
        else
            render json: {message: post.errors.full_messages}
        end
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
