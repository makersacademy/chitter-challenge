require_relative '../setup_test_database'

feature 'Create a new peep' do
  scenario 'User creates a new peep' do
    truncate_table
    visit '/'
    click_button 'Create Peeps'
    fill_in 'text', with: 'This is my first peep'
    click_button 'submit'
    click_button 'View Peeps'
    expect(page).to have_content 'This is my first peep'
  end
end