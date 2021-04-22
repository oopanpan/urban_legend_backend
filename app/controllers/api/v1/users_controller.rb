class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :profile, :show]

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        # render json: { id: user.id, username: user.username, bio: user.bio, keyword: user.keyword, avatar: rails_blob_path(user.avatar),
        # posts: user.posts,
        # followed: user.friends,
        # follower: user.inverse_friends }
        render json: { user: UserSerializer.new(user) }
    end

    def profile
        render json: { user: UserSerializer.new(current_user), avatar: rails_blob_path(current_user.avatar) }, status: :accepted
    end

    def create
        #! sign-up action
        user = User.new(user_params)
        user.avatar.attach(
            io: File.open('./public/avatars/default_avatar.png'),
            filename: 'default_avatar.png',
            content_type: 'application/png'
        )
        user.keyword='Global'
        user.bio="I'm a cosmopolitan."
        if user.save
            token = encode_token({ user_id: user.id })
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
            render json: { message: user.errors.full_messages }
        end
    end

    def update
        user = User.find(params[:id])
        avatar = params[:avatar]
        if avatar
            user.avatar.purge
        end
        if user.update(update_params)
            render json: { user: UserSerializer.new(user)}, status: :accepted
        else
            render json: {message: user.errors.full_messages}
        end

    end

    private

    def user_params
        params.require(:user).permit(:username, :email_address, :password, :password_confirmation, :keyword, :bio, :admin, :avatar)
    end

    def update_params
        params.permit(:id, :username,:keyword, :bio, :admin, :avatar)
    end
end