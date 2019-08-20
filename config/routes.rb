Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  get '/auth/:provider/callback', to:'sessions#twitter_create'
  
  get 'rankings/like', to:'rankings#like'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 
  get 'signup', to: 'users#new'
  resources :comments, only:[:create,:destroy,:new]
  resources :users, only: [:show, :new, :create]
  resources :restaurants, only: [:show, :new]
  resources :likes, only:[:create, :destroy]
  resources :charges, only: [:new,:create]
  #resources :restaurants drouo
   # member do
    #  get :like_microposts
  #  end
#  end
  
  #resources :likes, only: [:create, :destroy]
end
