def sign_up
  visit('/')
  click_button('Sign up')
  fill_in 'name', with: 'Test User'
  fill_in 'user_name', with: 'Tester'
  fill_in 'email', with: 'test@hotmail.com'
  fill_in 'password', with: 'testing123'
  click_button('Create Account')
end