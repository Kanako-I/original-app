Rails.application.routes.draw do
  devise_for :users
  get 'tops/index'
  get 'messages/index'
  get 'rooms/index'
  root to: "tops#index"

  resources :tops
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy, :index, :edit, :update] do
    resources :messages, only: [:index, :create, :destroy] 
  end
end
