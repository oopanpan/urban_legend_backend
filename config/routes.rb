Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'auth/login'
      get 'auth/auto_login'
      resources :comments
      resources :posts
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
