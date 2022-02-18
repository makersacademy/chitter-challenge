require 'pg'

feature 'Viewing chitters' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'A user can view chitters' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (message) VALUES ('Test peep 1');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Test peep 2');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Test peep 3');")

    visit('/peeps')

    expect(page).to have_content "Test peep 1"
    expect(page).to have_content "Test peep 2"
    expect(page).to have_content "Test peep 3"
  end
end