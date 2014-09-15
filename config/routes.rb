Rails.application.routes.draw do
  root to: 'home#show'
  devise_for :users

  resources :setup, only: :new
  resources :groups, path: 'classes'
end
