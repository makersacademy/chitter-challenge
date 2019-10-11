require "capybara/rspec"
require_relative "../../app"
require_relative '../spec_helper.rb'

feature 'Adding a new peep' do
  scenario 'A user can add a peep to Peep Manager' do
    visit('/peeps/new')
    fill_in('message', with: 'test')
    click_button('Submit')

    expect(page).to have_content('test')
  end
end
