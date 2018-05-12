require_relative '../../app.rb'
require 'pg'
require 'peep'

feature 'New Peeper' do
  scenario 'Clicking Sign Up on homepage takes user to sign up view' do
    visit '/peeps'
    click_button('Sign Up to Peep')
    expect(page).to have_content 'Please enter a username and password'
  end

  scenario 'Successful sign up' do
    visit '/signup'
    fill_in('username', with: 'Peeping Tom')
    fill_in('password', with: 'ilikepeeping')
    click_button('Submit Details')
    expect(page).to have_content "Welcome to Peep, Peeping Tom"
  end
end
