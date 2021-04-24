Rails.application.routes.draw do
  resources :peeps
  resources :users
  root 'users#index'
end
