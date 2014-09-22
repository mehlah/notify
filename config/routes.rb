Rails.application.routes.draw do
  root to: 'home#show'

  devise_for :users

  resources :setup, only: :new
  resources :groups, except: :index, path: 'classes' do
    resources :subscribers, only: [:new, :create]
    resources :messages, only: :create
  end
end
