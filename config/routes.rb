Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  resources :following
  root to: 'tweets#index'

end
