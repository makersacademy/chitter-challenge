require 'spec_helper'

feature 'As a user' do
  scenario 'you can access the homepage and see the options' do
    visit('/')
    expect(page).to have_content("Welcome To Chitter")
    expect(page).to have_button("View Peeps")
    expect(page).to have_button("Create Account")
  end
end
