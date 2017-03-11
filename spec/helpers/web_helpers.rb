def create_chitter_account
  visit('/')
  click_button('Sign Up')
  fill_in 'username', with: 'ayanit1'
  fill_in 'name', with: 'Albert'
  fill_in 'email_address', with: 'albert@hotmails.com'
  fill_in 'password', with: 'password'
  click_button 'Create Account'
end
