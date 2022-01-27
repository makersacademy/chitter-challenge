Rails.application.routes.draw do
  get 'users/new'
  root 'application#hello'
  match ':controller(/:action(/:id))(.:format)'
end
