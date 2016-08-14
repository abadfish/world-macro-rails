Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  # get '/auth/:provider/callback', to: 'sessions#create'
  resources :tweets
  resources :positions
  resources :posts
  resources :users, only: [:index, :edit,:show, :update, :destroy]
  resources :trades
  resources :comments
  resources :tags, only: [:index]

  root 'posts#index'

  post 'comments', to: 'comments#create'

  get 'about', to: 'static#about'
  get 'news_source', to: 'posts#get_news_source'

end
