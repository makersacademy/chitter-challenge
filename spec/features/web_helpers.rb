require './app.rb'

def sign_up
  visit '/'
  click_on 'Sign Up!'
  fill_in "email", with: 'eddy@gmail.com'
  fill_in "password", with: '1234'
  fill_in "name", with: 'Eddy'
  click_on "Create account"
end

def sign_up_and_log_in
  sign_up
  visit '/'
  fill_in "email", with: 'eddy@gmail.com'
  fill_in "password", with: '1234'
  click_on 'Login'
end
