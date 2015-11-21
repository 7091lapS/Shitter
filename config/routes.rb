Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  resources :followingstream
  root to: 'tweets#index'

end
