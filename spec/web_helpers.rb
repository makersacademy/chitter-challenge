def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'username', with: 'Aimee'
  fill_in 'password', with: 'password'
  click_button 'Register'
end
