Rails.application.routes.draw do
  get 'tops/index'
  get 'messages/index'
  root to: "tops#index"
end
