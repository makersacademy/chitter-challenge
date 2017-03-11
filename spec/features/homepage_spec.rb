require 'spec_helper'

feature 'As a user' do
  scenario 'you can access the homepage and see the options' do
    visit('/')
    expect(page).to have_content("Welcome to Chitter")
    expect(page).to have_button("View Peeps")
    expect(page).to have_button("Create Peep")
  end
end
