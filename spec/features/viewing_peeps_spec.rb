
require 'pg'

feature 'Viewing Peeps' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'Peep 1');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Peep 2');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Peep 3');")

    visit('/feed')

    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(page).to have_content "Peep 3"
  end
end
