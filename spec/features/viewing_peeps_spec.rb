require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see the peeps' do
    connection = PG.connect(dbname: 'peep_manager_test')

    connection.exec("INSERT INTO peeps VALUES (1, 'message one');")
    connection.exec("INSERT INTO peeps VALUES (2, 'message two');")
    connection.exec("INSERT INTO peeps VALUES (3, 'message three');")

    visit('/peeps')

    expect(page).to have_content "message one"
    expect(page).to have_content "message two"
    expect(page).to have_content "message three"
  end
end
