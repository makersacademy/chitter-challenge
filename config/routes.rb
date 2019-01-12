Rails.application.routes.draw do

  resources :peeps
  root "peeps#index"

end
