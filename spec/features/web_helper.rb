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
