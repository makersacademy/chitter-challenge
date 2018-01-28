
def sign_up
  visit '/'
  fill_in 'name', with: 'User'
  fill_in 'username', with: 'username'
  fill_in 'email', with: 'user.email@gmail.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Submit'
end
