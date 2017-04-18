def sign_up(name: 'Jean Tremblay',
                         username: 'jt14',
                         email: 'jean@example.com',
                         password:'trout',
                         password_confirmation: 'trout')
  visit 'users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
