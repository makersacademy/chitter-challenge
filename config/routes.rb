Rails.application.routes.draw do
  get 'users/new'
  root 'application#hello'
  get ':controller(/:action(/:id))(.:format)'
end
