require 'capybara/rspec'

feature 'Viewing homepage' do
  scenario 'Shows the welcome page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end
