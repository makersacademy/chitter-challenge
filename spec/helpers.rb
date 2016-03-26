def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in :name,     with: name
  fill_in :username, with: username
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
end

def log_in(username:, password:)
  visit '/session/new'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Log in!'
end
