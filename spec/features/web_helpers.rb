def sign_up(email, password, password_confirmation)
  visit '/users/new'
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end