Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'users#index'
      post '/login', to: 'auth#login'
      get 'auth/auto_login'
      get '/profile', to: 'users#profile'
      resources :friendships, only: [:create, :destroy]
      resources :comments
      resources :posts
      resources :users
      resources :likes, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
