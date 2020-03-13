require 'pg'

feature 'Visiting the homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Peep Manager"
  end
end

feature 'Viewing peeps' do
  scenario ' a user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES (1, 'First Peep');")
    connection.exec("INSERT INTO peeps VALUES (2, 'Second Peep');")
    connection.exec("INSERT INTO peeps VALUES (3, 'Third Peep');")

    visit('/peeps')

    expect(page).to have_content "First Peep"
    expect(page).to have_content "Second Peep"
    expect(page).to have_content "Third Peep"
  end
end