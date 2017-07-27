def sign_up(email: 'test@aol.com', username: 'username', password: 'password', password_confirmation: 'password')
  visit('/users/new')
  expect(page.status_code).to eq 200
  fill_in 'email', with: email
  fill_in 'username', with: username
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Log in'
end

def post_peep(message: 'message')
  visit('/peeps/new')
  expect(page.status_code).to eq 200
  fill_in 'message', with: message
  click_button 'post peep'
end
