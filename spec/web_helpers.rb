def sign_up(username: 'jo@jo.com', email: 'jo@jo.com', password: 'jojo', password_confirmation: 'jojo')
  visit('users/new')
  expect(page.status_code).to eq 200
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def log_in(username:, password:)
  visit('sessions/new')
  expect(page.status_code).to eq 200
  fill_in :username, with: username
  fill_in :password, with:password
  click_button 'Log in'
end