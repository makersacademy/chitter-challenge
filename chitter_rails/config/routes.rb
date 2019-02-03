Rails.application.routes.draw do
  get 'chitter/index'

  resources :posts

  root 'chitter#index'
end
