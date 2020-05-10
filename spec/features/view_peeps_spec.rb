require 'pg'

feature 'View peeps' do
  scenario 'A user can see the peeps' do
    connection = PG.connect(dbname: 'Chitter_Manager_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'A lovely day');")
    connection.exec("INSERT INTO peeps VALUES(2, 'An interesting day');")
    visit('/')
    expect(page).to have_content "A lovely day"
    expect(page).to have_content "An interesting day"
  end
end
