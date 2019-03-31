def sign_up(username)
  visit '/users/new'
  fill_in 'username', with: username
  fill_in 'name', with: 'Joe Bloggs'
  fill_in 'email', with: 'joe@bloggs.com'
  fill_in 'password', with: 'password123'
  click_button 'Create account'
end
