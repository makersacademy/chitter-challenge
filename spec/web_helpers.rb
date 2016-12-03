
def sign_up(email: 'isabel@example.com',
            name: 'Isabel',
            user_name: 'Isabel',
            password: 'test',
            password_confirmation: 'test')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def log_in( user_name: 'Isabel',
            password: 'test')
  visit '/log-in'
  fill_in :user_name, with: user_name
  fill_in :password, with: password
  click_button 'Log in'
end
