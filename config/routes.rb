Rails.application.routes.draw do
  devise_for :users
  get 'tops/index'
  get 'messages/index'
  get 'rooms/index'
  root to: "tops#index"

  resources :tops
  resources :users
  resources :rooms do
    resources :messages
  end
end
