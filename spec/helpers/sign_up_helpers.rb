def sign_up(name, username, email, password, password_confirmation)
  visit '/'
  click_button 'Sign Up'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign Up'
end
