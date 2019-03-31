def sign_up(name, username, email)
  visit '/users/new'
  fill_in 'username', with: username
  fill_in 'name', with: name
  fill_in 'email', with: email
  fill_in 'password', with: 'password123'
  click_button 'Create account'
end
