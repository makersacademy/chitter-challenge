def sign_up(username:, email:)
  visit('/')

  click_button 'Sign up'

  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :first_name, with: 'Test'
  fill_in :last_name, with: 'User'
  fill_in :password, with: '12345'

  click_button 'Create account'
end

def log_in(email:, password:)
  visit('/')

  click_button 'Log in'

  fill_in :email, with: email
  fill_in :password, with: password

  click_button 'Log in'
end
