Rails.application.routes.draw do
  root to: 'toppages#index'

  get '/auth/:provider/callback', to: 'sessions#twitter_create'
  get 'rankings/like', to: 'rankings#like'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :users, only: %w[show new create edit update] do
    get 'follows', to: 'users#follows'
    get 'followers', to: 'users#followers'
    get 'userlikes', to: 'users#userlikes', as: 'likes'
    get 'userposts', to: 'users#posts', as: 'posts'
  end

  resources :restaurants, only: %w[show new] do
    resources :comments, only: %w[new create destroy]
  end

  resources :likes, only: %w[create destroy]
  resources :charges, only: %w[new create]
  resources :relationships, only: %w[create destroy]
end
