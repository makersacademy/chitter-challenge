require './spec/spec_helper'

def sign_up
  visit('/sign_up')
  fill_in('name', with: 'Mike')
  fill_in('username', with: 'm1k3')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  click_button('Sign up')
end
