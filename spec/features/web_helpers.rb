def sign_up_for_chitter
  visit '/accounts/new'
  fill_in :email, with: 'user@example.com'
  fill_in :name, with: 'Test User'
  fill_in :username, with: 'testuser'
  fill_in :password, with: '123456'
  click_button 'Sign-up!'
end

def log_in_to_chitter
  visit '/accounts/login'
  fill_in :email, with: 'user@example.com'
  fill_in :password, with: '123456'
  click_button 'Log-in!'
end
