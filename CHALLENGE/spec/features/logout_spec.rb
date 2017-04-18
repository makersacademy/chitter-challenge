require 'spec_helper'

# USER STORY THREE
#
# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'User signs out' do

  before(:each) do
    User.create(username: 'username',
                email:    'user@example.com',
                password: 'password')
  end

  scenario 'while being signed in' do
    sign_in(email: 'user@example.com', password: 'password')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, username')
  end

end
