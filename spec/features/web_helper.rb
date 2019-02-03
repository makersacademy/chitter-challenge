def register_user
  visit '/'
  click_button 'Sign up'
  fill_in 'name', with: 'Test User'
  fill_in 'username', with: 'testuser'
  fill_in 'email', with: 'testuser@email.com'
  fill_in 'password', with: 'Password123'
  click_button 'Sign up'
end
