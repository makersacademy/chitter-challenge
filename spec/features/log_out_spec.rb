require 'sign_up_helper'

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'Logging out' do
  scenario 'Users can log out' do
    sign_up('hivemind')
    visit '/'
    click_button 'Log out'
    expect(page).to have_content 'Sign up or sign in to start peeping'
  end
end
