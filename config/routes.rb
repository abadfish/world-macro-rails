Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  resources :positions
  resources :posts
  resources :users, only: [:index, :edit,:show, :update, :destroy]
  resources :trades

  root 'posts#index'

  get 'about', to: 'static#about'

end
