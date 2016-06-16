Rails.application.routes.draw do
  devise_for :users

  resources :conversations
  resources :personal_messages
  resources :users

  mount ActionCable.server => '/cable'

  root to: 'conversations#index'
end
