def sign_up
  visit('/peeps/signup')
  fill_in('name', with: 'James Smith')
  fill_in('email', with: 'Jamessmith@hotmail.com')
  fill_in('username', with: 'james_smith')
  fill_in('password', with: 'Password123')
  click_button 'Submit'
end

def log_in
  visit('/peeps/login')
  fill_in('username', with: 'james_smith')
  fill_in('password', with: 'Password123')
  click_button 'Log in'
end
