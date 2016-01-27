def sign_in(username:               'example',
            password:               'password')
    visit '/users/new'
    fill_in 'existing_username', with: username
    fill_in 'existing_password', with: password
    click_button('Log in')
end

def post_message(message: 'This is a test message')
  sign_in(username: user.username,   password: user.password)
  click_button 'New Message'
  fill_in 'message', with: message
  click_button 'Post'
end

def sign_up(name:                   'Example Name',
            username:               'example',
            email:                  'example@gmail.com',
            password:               'password',
            password_confirmation:  'password')
    visit '/users/new'
    fill_in 'name', with: name
    fill_in 'username', with: username
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_button('Sign Up')
end
