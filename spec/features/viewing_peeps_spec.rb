require 'pg'

feature 'viewing Chitter' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'viewing peeps' do
  scenario 'a user can view peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'peep_1');")
    connection.exec("INSERT INTO peeps VALUES(2, 'peep_2');")
    connection.exec("INSERT INTO peeps VALUES(3, 'peep_3');")

    visit('/peeps')
    expect(page).to have_content "peep_3"
    expect(page).to have_content "peep_2"
    expect(page).to have_content "peep_1"
  end
end
