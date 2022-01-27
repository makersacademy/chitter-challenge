Rails.application.routes.draw do
  # get 'users/new'
  root to: redirect('/users')
  # get ':controller(/:action(/:id))(.:format)'
end
