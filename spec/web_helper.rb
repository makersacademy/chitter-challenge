def sign_up(user_name: 'kyaw', email: 'kyaw@gmail.com', password: '1234', confirmation: '1234')
  visit '/'
  click_button 'Sign up'
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: confirmation
  click_button 'Submit'
end
