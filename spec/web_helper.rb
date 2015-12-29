def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in :user_name, with: 'Edward'
  fill_in :email, with: 'edwardkerry@gmail.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Submit'

end
