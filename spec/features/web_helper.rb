def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  click_button 'Sign up'
end
