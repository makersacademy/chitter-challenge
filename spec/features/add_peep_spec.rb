require 'pg'

feature 'add new peep' do
  scenario 'user can add new peeps to the page' do
    connection = PG.connect(dbname: 'chitter_data_test')

    visit('/peeps')
    fill_in :username, with: 'RyanGrimes'
    fill_in :message, with: 'Testing 1, 2, 3'
    click_button('Post Peep')
    expect(page).to have_content 'Testing 1, 2, 3'
  end
end