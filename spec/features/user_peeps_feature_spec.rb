require './app'
require './setup_database_connection'

feature 'users peep' do
  scenario 'is displayed on main page' do
    visit '/'
    click_button 'Make a Peep'
    fill_in('peep', with: 'test peep')
    click_button 'Send'
    expect(page).to have_content 'test peep'
  end
end
