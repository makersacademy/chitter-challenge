def sign_in(email, password)
  visit '/'
  click_button 'Sign In'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Submit'
end
