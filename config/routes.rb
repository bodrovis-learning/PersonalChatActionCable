Rails.application.routes.draw do
  devise_for :users

  resources :conversations
  resources :personal_messages

  mount ActionCable.server => '/cable'

  root to: 'conversations#index'
end
