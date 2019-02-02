require 'spec_helper'
# require_relative '../controllers/app'
# require_relative 'web_helpers.rb'

feature 'Testing Infrastructure.' do

  scenario 'User is welcomed on homepage' do
    visit '/'
    welcome = 'Welcome to Shitter!'
    expect(page).to have_content(welcome)
  end

  scenario 'User can post a peep' do
    visit '/peeps'
    fill_in 'peep_entry', with: "My first peep!"
    click_on('Post')
    expect(page).to have_content("My first peep!")
  end

end
