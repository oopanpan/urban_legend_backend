Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#login'
      get 'auth/auto_login'
      get '/profile', to: 'users#profile'
      resources :comments
      resources :posts
      resources :users
      resources :likes, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
