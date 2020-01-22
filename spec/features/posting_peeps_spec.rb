require 'capybara/rspec'

feature 'posting peeps to chitter' do
  scenario 'user can post a peep to chitter' do
    visit '/peeps'
    fill_in :peep, with: "This is a test peep"
    click_button 'Post'

    expect(page).to have_content "This is a test peep"
  end
end
