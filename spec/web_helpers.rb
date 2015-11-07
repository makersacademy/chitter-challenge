require 'spec_helper'

def sign_up
  visit('/sign_up')
  fill_in(:email, with: 'me@me.com')
  fill_in(:password, with: 123)
  click_button 'Sign up'
end