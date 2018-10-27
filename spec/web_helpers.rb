def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'username', with: 'Aimee'
  click_button 'Register'
end
