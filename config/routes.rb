Rails.application.routes.draw do

  devise_for :users
  
  resources :peeps do
    resources :comments
  end

  root "peeps#index"

end
