def sign_up(username: 'TestUser1', name: 'Bobby Test', email: 'test@testmail.com', password: 'password', password_confirmation: 'password')
  visit('/users/new')
  fill_in 'username', with: username
  fill_in 'name', with: name
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  # click_button 'Create account'
end

def sign_out
  visit '/peeps'
  click_button 'sign out'
end
