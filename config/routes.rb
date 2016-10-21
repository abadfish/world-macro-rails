Rails.application.routes.draw do
  get 'subscribe/new'

  get 'subscribe/new'

  resources :uploads
  devise_for :views
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'users/registrations' }
  resources :tweets
  resources :positions
  resources :posts
  resources :trades
  post 'trades/upload', to: 'trades#upload'
  resources :comments
  resources :tags, only: [:index, :destroy]

  root 'posts#index'

  post 'uploads', to: 'uploads#create'
  post 'comments', to: 'comments#create'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'
  get 'performance', to: 'static#performance'
  get 'news_source', to: 'posts#get_news_source'

  resources :users, only: [:index, :edit,:show, :update, :destroy] do
    resources :insights, only: [:new, :create, :show, :index]
  end

  resources :insights
  resources :subscriptions
  resources :charges

end
