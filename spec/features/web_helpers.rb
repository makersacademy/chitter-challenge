require 'pg'
require 'user'
require 'chitter'

def sign_up
  click_link('Sign Up')
  fill_in(:first_name, with: 'Amy')
  fill_in(:last_name, with: 'Smith')
  fill_in(:email, with: 'amy_smith@mail.com')
  fill_in(:username, with: 'AmyS')
  fill_in(:password, with: 'password')
  click_button('Submit')
end

def log_in
  click_link('Log In')
  fill_in(:username, with: 'AmyS')
  fill_in(:password, with: 'password')
  click_button('Submit')
end

def log_in_wrong_username
  click_link('Log In')
  fill_in(:username, with: 'Bubba')
  fill_in(:password, with: 'password')
  click_button('Submit')
end

def log_in_wrong_password
  click_link('Log In')
  fill_in(:username, with: 'AmyS')
  fill_in(:password, with: 'wrong_password')
  click_button('Submit')
end

def log_out
  click_link('Log Out')
end

def add_new_post
  click_link('Add New Post')
  fill_in(:content, with: "First post by Amy")
  click_button('Submit')
end
