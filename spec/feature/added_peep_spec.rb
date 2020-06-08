require 'sinatra'
require 'pg'

feature 'Add peep' do
  scenario 'it should allow user input' do
    visit '/add_peep'
    expect(page).to have_content "PEEP:"
    expect(page).to have_field "uname"
  end

  scenario 'We should be able to see a new peep' do
    visit '/add_peep'
    fill_in 'chit', with: 'test'
    fill_in 'uname', with: 'nwmbutler'
    click_button 'PEEP'
    expect(page).to have_content('test', 'nwmbutler')
  end
end
