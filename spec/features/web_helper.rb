def sign_up(first_name: 'Annemarie', last_name: 'Kohler', username: 'Anne',
  email: 'anne@chittr.com', password: 'dog', password_confirmation: 'dog')
  visit '/users/new'
  fill_in :first_name, with: first_name
  fill_in :last_name, with: last_name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
