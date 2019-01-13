def sign_up
  visit '/'
  click_on 'Sign up'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'secret123'
  fill_in :name, with: 'Celine Ka'
  fill_in :username, with: 'Unicorn'
  click_button 'Sign up'
end

def log_in
  visit '/'
  click_on 'Log in'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'secret123'
  click_button 'Log in'
end
