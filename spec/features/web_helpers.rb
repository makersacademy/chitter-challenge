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

def recover_password
  visit '/users/recover'
  fill_in :email, with: "example@example.com"
  click_button "Submit"
end

def set_password(password, password_confirmation)
  visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Submit"
end
