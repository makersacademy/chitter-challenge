require 'capybara'
require 'pg'

feature 'message' do
  scenario 'add message' do
    connection = PG.connect(dbname: 'chitter_manager_test')
    visit '/peep'
    fill_in 'message', with: 'My first Chitter'
    click_button 'Submit'
    expect(page).to have_content 'My first Chitter'
  end
end
