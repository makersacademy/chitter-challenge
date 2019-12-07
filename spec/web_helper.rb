def sign_in
  visit '/'
  click_on 'Log in'
  fill_in 'username', with: 'dbacall'
  fill_in 'password', with: 'password'
  click_on 'Log in'
end

def post_message(message)
  click_on 'Post Message'
  fill_in 'message', with: "#{message}"
  click_on 'Post'
end

def create_account
  click_on 'Create Account'
  fill_in 'username', with: 'dbacall'
  fill_in 'email', with: 'dbacall@hotmail.co.uk'
  fill_in 'password', with: 'password'
  click_on 'Create'
end
