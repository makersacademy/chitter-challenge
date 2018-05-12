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
    click_button('Submit Details')
    expect(page).to have_content "Welcome to Peep!"
  end
end
