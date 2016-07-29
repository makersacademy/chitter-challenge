require 'spec_helper'

def sign_up(full_name: 'Joe Sweeny',
            username: 'joesweeny',
            email: 'joesweeny84@hotmail.com',
            password: 'buddy123',
            password_confirmation: 'buddy123')
  visit '/users/new'
  fill_in :full_name, with: full_name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end
