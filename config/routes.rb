Rails.application.routes.draw do
  get 'chitter/index'

  resources :peeps

  root 'chitter#index'
end
