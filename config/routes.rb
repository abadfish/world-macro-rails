Rails.application.routes.draw do
  devise_for :views
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :tweets
  resources :positions
  resources :posts
  # resources :users, only: [:index, :edit,:show, :update, :destroy]
  resources :trades
  resources :comments
  resources :tags, only: [:index]

  root 'posts#index'

  post 'comments', to: 'comments#create'

  get 'about', to: 'static#about'
  get 'news_source', to: 'posts#get_news_source'

  resources :users, only: [:index, :edit,:show, :update, :destroy] do
    resources :insights, only: [:new, :create, :show, :index]
  end



  resources :insights

  # get 'users/:id/insights', to: 'user#insights_index'
  # get 'users/:id/insights/:insight_id', to: 'users#insight'

end
