def sign_up
  fill_in 'email', with: 'test_email'
  fill_in 'password', with: 'test_password'
  fill_in 'first_name', with: 'test_first_name'
  fill_in 'last_name', with: 'test_last_name'
  fill_in 'username', with: 'test_username'
  click_button 'Sign Up'
end
