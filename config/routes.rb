Rails.application.routes.draw do
  devise_for :views
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
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

  resources :contributors, only: [:show] do
    resources :insights, only: [:show, :index]
  end

  resources :contributors

  resources :insights, only: [:index, :show, :new, :create, :edit, :update]

  # get 'contributors/:id/insights', to: 'contributors#insights_index'
  # get 'contributors/:id/insights/:insight_id', to: 'contributors#insight'

end
