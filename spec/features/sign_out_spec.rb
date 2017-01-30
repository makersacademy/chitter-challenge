require './spec/spec_helper'

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'logging out' do
  scenario 'so I can log out of chitter' do
    sign_in
    visit('/sessions/log_out')
    click_button('Log out')
    expect(page).to have_content 'Goodbye!'
  end
end
