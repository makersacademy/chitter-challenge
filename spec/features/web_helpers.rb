def register_user
  visit '/users/new'
  fill_in 'email', with: 'test@email.com'
  fill_in 'username', with: 'unique_user'
  fill_in 'name', with: 'Test User'
  fill_in 'password', with: 'h3ll0wor!d'
  click_button 'Sign up'
end

def log_in
  visit '/'
  fill_in 'username', with: 'unique_user'
  fill_in 'password', with: 'h3ll0wor!d'
  click_button 'Log in'
end

def log_out
  visit '/'
  click_button 'Log out'
end
