require 'spec_helper'

def sign_up
  visit '/'
  click_link('Sign up')
  fill_in('name', :with => 'Mica')
  fill_in('username', :with => 'Meesh')
  fill_in('email', :with => 'micawhitby@gmail.com')
  fill_in('password', :with => 'password')
  click_button('Sign up')
end

def faulty_email_sign_up
  visit '/'
  click_link('Sign up')
  fill_in('name', :with => 'Mica')
  fill_in('username', :with => 'Meesh')
  fill_in('email', :with => 'micawhitby')
  fill_in('password', :with => 'password')
  click_button('Sign up')
end

def empty_sign_up
  visit '/'
  click_link('Sign up')
  fill_in('name', :with => '')
  fill_in('username', :with => '')
  fill_in('email', :with => '')
  fill_in('password', :with => '')
  click_button('Sign up')
end

def sign_up_dup_email
  visit '/'
  click_link('Sign up')
  fill_in('name', :with => 'Mica')
  fill_in('username', :with => 'Username')
  fill_in('email', :with => 'micawhitby@gmail.com')
  fill_in('password', :with => 'password')
  click_button('Sign up')
end

def sign_up_dup_username
  visit '/'
  click_link('Sign up')
  fill_in('name', :with => 'Mica')
  fill_in('username', :with => 'Meesh')
  fill_in('email', :with => 'micawhitby@hotmail.co.uk')
  fill_in('password', :with => 'password')
  click_button('Sign up')
end

def log_in
  fill_in('email', :with => 'micawhitby@gmail.com')
  fill_in('password', :with => 'password')
  click_button('Log in')
end

def log_in_wrong_password
  fill_in('email', :with => 'micawhitby@gmail.com')
  fill_in('password', :with => 'badpassword')
  click_button('Log in')
end
