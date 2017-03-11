def create_chitter_account(username: 'ayanit1',
                          name: 'Albert',
                          email_address: 'albert@gmail.com',
                          password: 'password',
                          password_confirmation: 'password')
  visit('/')
  click_button('Sign Up')
  fill_in 'username', with: username
  fill_in 'name', with: name
  fill_in 'email_address', with: email_address
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Create Account'
end
