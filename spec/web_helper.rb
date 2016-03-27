def sign_up_correctly
  visit '/'
  click_button 'Sign up'
  fill_in :username, with: 'Marty'
  fill_in :email, with: 'martymcfly@future.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end
