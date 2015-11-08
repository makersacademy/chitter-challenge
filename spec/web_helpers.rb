def sign_up
  visit '/'
  click_button 'Register'
  fill_in :email,    with: 'mariann@email.com'
  fill_in :username, with: 'mariann013'
  fill_in :password, with: 'Password'
  click_button 'Submit'
end
