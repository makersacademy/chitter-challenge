require './lib/user'
require './lib/database_connection'

feature 'view peeps' do
  scenario 'A user can see peeps' do
    DatabaseConnection.query("INSERT INTO peeps VALUES(1, 'My first peep!');")
    DatabaseConnection.query("INSERT INTO peeps VALUES(2, 'Hello, World');")

    visit('/peeps')

    expect(page).to have_content "My first peep!"
    expect(page).to have_content "Hello, World"
  end
end
