require 'pg'

feature 'add new peep' do
  scenario 'user can add new peeps to the page' do
    connection = PG.connect(dbname: 'chitter_data_test')

    visit('/')
    fill_in :username, with: 'RyanGrimes'
    fill_in :message, with: 'This is my first peep :D'
    click_button('Submit')
    expect(page).to have_content 'This is my first peep :D'
  end
end