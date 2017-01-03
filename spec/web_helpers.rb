
def sign_up(email: 'isabel@example.com',
            name: 'Isabel',
            username: 'Isabel',
            password: 'test',
            password_confirmation: 'test')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def log_in( username: 'Isabel',
            password: 'test')
  visit '/log-in'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Log in'
end
