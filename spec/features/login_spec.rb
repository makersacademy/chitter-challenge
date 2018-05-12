require_relative '../../app.rb'
require 'pg'
require 'peep'

feature 'User logs in' do
  scenario 'Clicking Log in on homepage takes user to log in view' do
    visit '/peeps'
    click_button('Log in to start Peeping')
    expect(page).to have_content 'Enter username and password to start Peeping'
  end

  scenario 'Logging in takes user to homepage' do
    visit '/login'
    fill_in('log_username', with: 'Peeping Sally')
    fill_in('log_password', with: 'helikespeeping')
    click_button('Login')
    expect(page).to have_content "What's up Peeps?"
  end
end
