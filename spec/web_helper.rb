def sign_up
  visit '/'
  click_button 'Sign up'
  fill_in :user_name, with: 'kyaw'
  fill_in :email, with: 'kyaw@gmail.com'
  fill_in :password, with: '1234'
  # fill_in :confirmation, with: '1234'
  click_button 'Submit'
end
