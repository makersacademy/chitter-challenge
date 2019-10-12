feature 'Viewing peeps' do
  scenario 'A user can view peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # test data
    connection.exec("INSERT INTO peeps VALUES(1, 'first peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'second peep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'third peep');")

    visit('/peeps')

    expect(page).to have_content "first peep"
    expect(page).to have_content "second peep"
    expect(page).to have_content "third peep"
  end
end
