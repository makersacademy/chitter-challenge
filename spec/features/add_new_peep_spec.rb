require 'capybara/rspec'

feature 'Add new peep' do
  scenario "redirects to /view page" do
    visit('/chitter')
    click_button 'Peep!'
    expect(page).to have_current_path '/chitter/view'
  end
end
