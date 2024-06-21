require 'capybara/rspec'
require_relative '../../app'
Capybara.app = Chitter

feature 'homepage' do
  scenario 'shows the homepage' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
end
