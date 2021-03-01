require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')


  connection.exec("INSERT INTO peeps VALUES(1, 'Yo');")
  connection.exec("INSERT INTO peeps VALUES(2, 'I just ate');")
  connection.exec("INSERT INTO peeps VALUES(3, 'Goodnight everyone');")
    visit('/timeline')

    expect(page).to have_content "Yo"
    expect(page).to have_content "I just ate"
    expect(page).to have_content "Goodnight everyone"
  end
end
