require 'spec_helper'

def create_user
  visit '/'
  fill_in 'newuser_name', with: 'FirstName LastName'
  fill_in 'newuser_username', with: 'User'
  fill_in 'newuser_email', with: 'user@usermail.com'
  fill_in 'newuser_password', with: '123456'
  click_button 'Create user'
end

def create_user_log_in
  create_user
  visit '/'
  click_link 'here'
  fill_in 'user_name', with: 'User'
  fill_in 'user_password', with: '123456'
  click_button 'Log in'
end
