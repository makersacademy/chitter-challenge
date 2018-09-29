feature 'Viewing peeps' do
  scenario 'a user can view all of their peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'My third peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'My second peep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'My first peep');")

    visit '/peeps'
    expect(page).to have_content "My first peep"
    expect(page).to have_content "My second peep"
    expect(page).to have_content "My third peep"
  end
end
