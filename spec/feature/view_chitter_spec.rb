require 'pg'

feature 'Viewing Chitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'Viewing chitter feed' do
  scenario 'User can see all peeps in feed' do
    connection = PG.connect(dbname: 'chitter_app_test')

    connection.exec("INSERT INTO chitter (peep) VALUES('First Peep!');")
    connection.exec("INSERT INTO chitter (peep) VALUES('Second Peep!');")
    connection.exec("INSERT INTO chitter (peep) VALUES('Third Peep!');")

    visit('/feed')

    expect(page).to have_content "First Peep!"
    expect(page).to have_content "Second Peep!"
    expect(page).to have_content "Third Peep!"
  end
end
