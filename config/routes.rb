Rails.application.routes.draw do
  devise_for :views
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'users/registrations' }
  resources :tweets
  resources :positions
  resources :posts
  resources :trades
  resources :comments
  resources :tags, only: [:index]

  root 'posts#index'

  post 'comments', to: 'comments#create'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'
  get 'news_source', to: 'posts#get_news_source'

  resources :users, only: [:index, :edit,:show, :update, :destroy] do
    resources :insights, only: [:new, :create, :show, :index]
  end

  resources :insights
  resources :charges

end
