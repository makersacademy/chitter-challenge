require_relative '../../app.rb'
require 'pg'
require 'peep'
require './spec/features/sign_up_helper'

feature 'User logs out' do
  scenario 'Logged in user logs out from homepage' do
    user_signs_up
    click_button('Return to Peeps')
    click_button('Logout')
    expect(page).to_not have_content "Welcome back, Peeping Sally"
    expect(page).to have_content "Goodbye Peeper!"
  end

  scenario 'No user logged in when returns to homepage' do
    user_signs_up
    click_button('Return to Peeps')
    click_button('Logout')
    click_button('Have another Peep')
    expect(page).to_not have_content "Welcome back, Peeping Sally"
    expect(page).to have_content "What's up Peeps?"
  end
end
