require 'capybara/rspec'

feature 'View Chitter Home Page' do
  scenario 'visiting the index page' do
    visit('/')
  expect(page).to have_content 'Chitter Home Page'
  end
end
