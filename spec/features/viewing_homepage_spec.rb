require 'capybara/rspec'

feature 'Viewing homepage' do
  scenario 'Shows the welcome page' do
    visit('/chitter')
    expect(page).to have_content "Welcome to Chitter"
    expect(page).to have_button "Peep!"
  end
end
