require 'capybara/rspec'

feature 'Add new peep' do
  scenario "adds new post to database" do
    visit('/chitter')
    fill_in 'peep', with: 'first peep'
    click_button 'Peep!'
    expect(page).to have_content 'first peep'
  end
end
