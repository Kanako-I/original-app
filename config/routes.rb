Rails.application.routes.draw do
  devise_for :users
  get 'tops/index'
  get 'messages/index'
  root to: "tops#index"

  resources :messages
  resources :tops
end
