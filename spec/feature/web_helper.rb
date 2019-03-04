def create_user(username: 'simon', password: 'strong')
  User.create(username: username, password: password)
end

def login(username:, password:)
  visit('/login')
  submit_username_password(username: username, password: password)
end

def register(username:, password:)
  visit('/register')
  submit_username_password(username: username, password: password)
end

def submit_username_password(username:, password:)
  fill_in('username', with: username)
  fill_in('password', with: password)
  click_button 'Submit'
end

def post_peep(content)
  fill_in('content_input', with: content)
  click_button 'Submit'
end
