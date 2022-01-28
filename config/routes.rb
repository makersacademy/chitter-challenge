Rails.application.routes.draw do
  get 'users/new'
  root 'application#hello'
  # get ':users(/:create(/:id))(.:format)'
end
