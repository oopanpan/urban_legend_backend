class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :profile]

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: { user_id: user.id, username: user.username, bio: user.bio, keyword: user.keyword, avatar: rails_blob_path(user.avatar) }
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        #! sign-up action
        user = User.new(user_params)
        user.avatar.attach(
            io: File.open('./public/avatars/default_avatar.png'),
            filename: 'default_avatar.png',
            content_type: 'application/png'
        )
        if user.save
            token = encode_token({ user_id: user.id })
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
            render json: { error: user.errors.full_messages }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email_address, :password, :password_confirmation, :keyword, :bio, :admin, :avatar)
    end
end