require './spec/spec_helper'

def sign_up
  visit('/users/new')
  fill_in('name', with: 'Mike')
  fill_in('username', with: 'm1k3')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  click_button('Sign up')
end

def sign_up_no_details
  visit('/users/new')
  click_button('Sign up')
end

def sign_up_bad_email
  visit('/users/new')
  fill_in('name', with: 'Mike')
  fill_in('username', with: 'm1k3')
  fill_in('email', with: 'test')
  fill_in('password', with: 'password')
  click_button('Sign up')
end

def sign_in
  sign_up
  visit('/sessions/new')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  click_button('Sign in')
end
