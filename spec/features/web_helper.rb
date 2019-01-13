def sign_up
  visit('/')
  click_on 'Sign Up'
  expect(page.current_path).to eq('/signup')
  fill_in :email, with: 'myemail@email.com'
  fill_in :password, with: 'mypassword'
  fill_in :name, with: 'myname'
  fill_in :username, with: 'myusername'
  click_on 'Submit'
end

def post_peep
  sign_up
  fill_in :peep, with: 'Writing a peep'
  click_button 'Submit your peep'
end

def log_in
  sign_up
  click_on 'Log out'
  click_on 'Log In'
  fill_in :email, with: 'myemail@email.com'
  fill_in :password, with: 'mypassword'
  click_button 'Sign In'
end

def log_out
  sign_up
  log_in
  click_on 'Log out'
end
