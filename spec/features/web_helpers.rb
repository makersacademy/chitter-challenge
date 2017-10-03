def sign_up(email: 'example@example.com',
                password: 'example',
                password_confirmation: 'example')
  visit('/users/new')
  expect(page.status_code).to eq 200
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up to Chitter'
end

def log_in(email:, password:)
  visit('/sessions/new')
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end
