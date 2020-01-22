require 'capybara/rspec'

feature 'timestamps' do
  scenario 'peeps show the time and date when they were posted' do
    visit '/peeps'
    fill_in :peep, with: "This is a test peep"
    click_button 'Post'

    expect(page).to have_content "This peep was created at"
  end
end
