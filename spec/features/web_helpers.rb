def post_three_messages
  message = 'I am a first peep!'
  message_2 = 'I am a second peep!'
  message_3 = 'I am a third peep!'
  visit '/'
  fill_in 'peep', with: message
  click_button 'Submit'
  fill_in 'peep', with: message_2
  click_button 'Submit'
  fill_in 'peep', with: message_3
  click_button 'Submit'
end

def post_one_message
  message = 'I am a new peep!'
  visit '/'
  fill_in 'peep', with: message
  click_button 'Submit'
end

def visit_site_and_click_sign_up
  visit '/'
  click_button 'Sign Up'
end

def fill_in_signup_form
  fill_in 'name', with: 'Ivan the Terrible'
  fill_in 'username', with: 'ivan'
  fill_in 'email', with: 'ivan@fakeemail.com'
  fill_in 'password', with: 'password'
  click_button 'Submit'
end

def create_user
  User.create(name: 'Ivan', username: 'ivan', email: 'fake@fake.com', password_hash: PasswordManager.hash('pass'))
end

def create_second_user
  User.create(name: 'Prince John', username: 'pj', email: 'prince@fake.com', password_hash: PasswordManager.hash('princepass'))
end

def post_message_tag_second_user
  message = 'I am tagging @pj in this message.'
  visit '/'
  fill_in 'peep', with: message
  click_button 'Submit'
end

def valid_login
  visit '/'
  click_button 'Login'
  fill_in(:username, with: 'ivan')
  fill_in(:password, with: 'pass')
  click_button('Submit')
end

def login_wrong_password
  visit '/'
  click_button 'Login'
  fill_in(:username, with: 'ivan')
  fill_in(:password, with: 'fake')
  click_button('Submit')
end

def login_wrong_username
  visit '/'
  click_button 'Login'
  fill_in(:username, with: 'fake')
  fill_in(:password, with: 'pass')
  click_button('Submit')
end
