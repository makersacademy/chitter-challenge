feature 'viewing peeps' do
  scenario 'A user can see all their peeps' do
    connection = PG.connect(dbname: 'peeps_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Watching TV' );")
    connection.exec("INSERT INTO peeps VALUES(2, 'Getting a haircut' );")

    visit('/peeps')

    expect(page).to have_content "Watching TV"
    expect(page).to have_content "Getting a haircut"
  end
end
