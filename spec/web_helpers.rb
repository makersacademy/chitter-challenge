def sign_up(email: 'test@test.com',
            password: 'password',
            password_confirmation: 'password',
            username: 'test')
  visit '/accounts/new'
  fill_in 'email', with: email
  fill_in 'username', with: username
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'register account'
end

def log_in( password: 'password',
            username: 'test')
  visit '/sessions/new'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'log in'
end

def log_out
  click_button 'log out'
end
