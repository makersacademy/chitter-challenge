def sign_up
  visit '/users/new'
  fill_in(:name, with: 'New User')
  fill_in(:username, with: 'newuser')
  fill_in(:email, with: 'test@test.com')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('sign up')
end

def no_username_sign_up
  visit '/users/new'
  fill_in(:name, with: 'New User')
  fill_in(:email, with: 'test@test.com')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('sign up')
end

def invalid_email_sign_up
  visit '/users/new'
  fill_in(:name, with: 'New User')
  fill_in(:username, with: 'newuser')
  fill_in(:email, with: 'test')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('sign up')
end

def no_email_sign_up
  visit '/users/new'
  fill_in(:name, with: 'New User')
  fill_in(:username, with: 'newuser')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('sign up')
end

def no_password_sign_up
  visit '/users/new'
  fill_in(:name, with: 'New User')
  fill_in(:username, with: 'newuser')
  fill_in(:email, with: 'test@test.com')
  click_button('sign up')
end

def not_matching_passwords_sign_up
  visit '/users/new'
  fill_in(:name, with: 'New User')
  fill_in(:username, with: 'newuser')
  fill_in(:email, with: 'test@test.com')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'passwor')
  click_button('sign up')
end

def sign_in
  visit '/sessions/new'
  fill_in(:username, with: 'newuser')
  fill_in(:password, with: 'password')
  click_button('sign in')
end
