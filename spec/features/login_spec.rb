require_relative '../../app.rb'
require 'pg'
require 'peep'
require './spec/features/login_helper'

feature 'User logs in' do
  scenario 'Clicking Log in on homepage takes user to log in view' do
    visit '/peeps'
    click_button('Log in to start Peeping')
    expect(page).to have_content 'Enter username and password to start Peeping'
  end

  scenario 'Logging in takes user to homepage' do
    user_logs_in
    expect(page).to have_content "Welcome back, Peeping Sally"
  end
end
