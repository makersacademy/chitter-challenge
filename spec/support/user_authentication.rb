def sign_up
  visit '/'
  click_button 'Create New Account'
  fill_in('username', with: 'Sherwin')
  fill_in('password', with: 'test123')
  click_button('Sign up')
end

def log_in
  visit '/'
  fill_in('username', with: 'Sherwin')
  fill_in('password', with: 'test123')
  click_button('Log In')
end
