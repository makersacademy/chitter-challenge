feature 'Viewing chitter' do
  scenario 'a user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(170));")
    connection.exec("INSERT INTO peeps (text) VALUES('This is Peep 1');")
    connection.exec("INSERT INTO peeps (text) VALUES('This is Peep 2');")
    visit('/peeps')
    expect(page).to have_content "This is Peep 1"
    expect(page).to have_content "This is Peep 2"
  end
end
