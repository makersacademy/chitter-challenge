require 'spec_helper'
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User can Sign up' do
  
  scenario 'User count increase by one' do
    expect { sign_up_two }.to change{User.count}.by(1)
  end
  #
  # scenario 'Email address is correctly added to database' do
  #   click_button('Sign up')
  #   user = User.first(username: 'Dave')
  #   expect(user.email).to eq 'dave@gmail.com'
  # end
end
