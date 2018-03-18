require 'spec_helper.rb'

def sign_up(username = 'AName')
  visit('/')
  click_button('Sign up')

  fill_in('name', with: 'A Name')
  fill_in('username', with: username)
  fill_in('email', with: 'aname@aemail.com')
  fill_in('password', with: 'apassword')
  click_button('Sign up')
end
