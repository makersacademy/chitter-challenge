require './spec/spec_helper'

def sign_up
  visit('/users/new')
  fill_in('name', with: 'Mike')
  fill_in('username', with: 'm1k3')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  click_button('Submit')
end

def sign_up_no_details
  visit('/users/new')
  click_button('Sign Up!')
  click_button('Submit')
end

def sign_up_bad_email
  visit('/users/new')
  fill_in('name', with: 'Mike')
  fill_in('username', with: 'm1k3')
  fill_in('email', with: 'test')
  fill_in('password', with: 'password')
  click_button('Submit')
end

def create_user
  User.create(name: 'Mike',
              username: 'm1k3',
              email: 'test@test.com',
              password: 'password')
end

def sign_in
  create_user
  visit('/sessions/new')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  click_button('Sign in')
end

def sign_in_wrong_details
  create_user
  visit('/sessions/new')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'wrong')
  click_button('Sign in')
end

def create_peep
  visit('/main')
  fill_in('peep_content', with: 'This is my first peep')
  click_button('Post')
end
