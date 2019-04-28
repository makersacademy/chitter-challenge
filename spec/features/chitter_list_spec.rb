feature 'Viewing peeps' do
  scenario 'checks current peeps' do
    connection = PG.connect :dbname => 'chitter_test'

    connection.exec("INSERT INTO peeps (message, user_id) VALUES ('Hello!', 'Makers');")
    visit('/chitters')
    expect(page).to have_content "Hello!"
  end
end

feature 'Adding new peeps' do
  scenario 'add a new peep' do

    visit('/')
    click_button('Add a new peep!')
    fill_in('user_id', with: 'Spock')
    fill_in('message', with: 'Live long and prosper!')
    click_button('Submit')
    expect(page).to have_content('Live long and prosper!')
  end
end
