require 'pg'

feature 'Viewing Peeps' do
  scenario 'A user can see Peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep');")
    connection.exec("INSERT INTO peeps (message) VALUES('This is another peep');")
    connection.exec("INSERT INTO peeps (message) VALUES('This is a third peep');")

    visit('/')

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "This is another peep"
    expect(page).to have_content "This is a third peep"
  end
end
