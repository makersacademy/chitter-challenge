def sign_up(name: 'Georgia',
            username: 'grmillsy',
            email: 'g@hotmail.com',
            password: '123',
            password_confirmation: '123')
  visit '/users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def log_in(username:, password:)
  visit 'sessions/new'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Log in'
end
