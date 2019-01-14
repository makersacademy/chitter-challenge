def create_user(username, email, password)
  User.create(
    username: username,
    email: email,
    password: password
  )
end

def sign_in
  visit '/'
  fill_in :sign_in_username, with: 'christos'
  fill_in :sign_in_password, with: 'Makers123'
  click_button 'Sign In'
end

def input_signup_details
  fill_in :sign_up_username, with: 'christos'
  fill_in :sign_up_email, with: 'christos@makers.com'
  fill_in :sign_up_password, with: 'Makers123'
end

def post_chirrup
  fill_in :chirrup, with: 'Sqwark!'
  click_button 'Post'
end

def create_message(message)
  Chirrup.create(content: message)
end
