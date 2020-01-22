require 'pg'

feature 'Viewing Chitter Homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature 'Viewing Peep Timeline' do
  scenario 'a user can view peeps' do
    connection = PG.connect(dbname: 'Chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Hello World!');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Monday again :(!');")

    visit('/timeline')

    expect(page).to have_content("Hello World!")
    expect(page).to have_content("Monday again :(")
  end
end
