Rails.application.routes.draw do

  devise_for :users
  resources :peeps
  root "peeps#index"

end
