def sign_up
  email = 'user@user.com'
  password = '123'

  visit('/user/new')
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password
  click_button 'Sign Up'
end
