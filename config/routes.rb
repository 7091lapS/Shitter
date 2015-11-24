Rails.application.routes.draw do
  devise_for :users
  resources  :users, :only => [:index, :show] do
    member do
      get :following, :followers
    end
  end
  resources :tweets
  resources :followingstream
  resources :relationships
  root to: 'tweets#index'

end
