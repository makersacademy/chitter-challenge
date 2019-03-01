def create_user(username:, password:)
  User.create(username: 'simon', password: 'strong')
end

def login(username:, password:)
  visit('/login')
  submit_username_password(username: username, password: password)
end

def submit_username_password(username:, password:)
  fill_in('username', with: username)
  fill_in('password', with: password)
  click_button 'Submit'
end