require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'peep_manager_test')

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'Salut!');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Ca farte?');")

    visit('/peeps')

    expect(page).to have_content "Salut!"
    expect(page).to have_content "Ca farte?"
  end
end