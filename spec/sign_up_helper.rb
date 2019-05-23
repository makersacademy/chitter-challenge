def sign_up(name, username, email, password)
  visit '/users/new'
  fill_in 'username', with: username
  fill_in 'name', with: name
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Create account'
end
