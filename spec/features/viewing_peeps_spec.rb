feature 'Viewing peeps' do
  scenario 'A user can see peeps in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Good morning');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Good afternoon');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Good night');")

    visit('/peeps')

    expect(page).to have_content "Good night"
    expect(page).to have_content "Good afternoon"
    expect(page).to have_content "Good morning"
  end
end
