Rails.application.routes.draw do
  # start of og code
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # resources :users
  # get 'chitter/index'
  #
  # resources :peeps
  #
  # root 'chitter#index'
  # end of og code

  root 'chitter#index'

  resources :peeps
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'





end
