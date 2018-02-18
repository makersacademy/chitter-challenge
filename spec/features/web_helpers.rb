def sign_up
  visit '/'
  click_button "Sign up"
  fill_in 'username', with: 'Daniel'
  fill_in 'email', with: 'example@test.com'
  fill_in 'password', with: '12345'
  click_button 'Sign up'
end
