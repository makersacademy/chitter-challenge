def post_peep
  visit '/peeps/new'
  fill_in :peep_title, with: 'First peep'
  fill_in :peep_body, with: 'I love summer!'
  click_button 'Save Peep'
end

def sign_up
  visit '/users/sign_up'
  fill_in :user_name, with: 'Test'
  fill_in :user_username, with: 'TestTest'
  fill_in :user_email, with: 'test@test.com'
  fill_in :user_password, with: 'password'
  fill_in :user_password_confirmation, with: 'password'
  click_button 'Sign up'
end

def log_in
  visit '/users/sign_in'
  fill_in :user_email, with: 'test@test.com'
  fill_in :user_password, with: 'password'
  click_button 'Log in'
end
