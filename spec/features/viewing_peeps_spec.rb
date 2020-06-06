require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'i need a holiday');")
    connection.exec("INSERT INTO peeps VALUES(2, 'look at my cat');")
    connection.exec("INSERT INTO peeps VALUES(3, 'HUNGRY');")

    visit('/')

    expect(page).to have_content "i need a holiday"
    expect(page).to have_content "look at my cat"
    expect(page).to have_content "HUNGRY"
  end
end
