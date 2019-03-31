def sign_up(name, username)
  visit '/users/new'
  fill_in 'username', with: username
  fill_in 'name', with: name
  fill_in 'email', with: 'joe@bloggs.com'
  fill_in 'password', with: 'password123'
  click_button 'Create account'
end
