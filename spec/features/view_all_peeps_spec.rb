feature 'Viewing a list of peeps' do
  scenario 'A user can see a list of all peeps' do
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("INSERT INTO peeps (body) VALUES('My first peep');")
  connection.exec("INSERT INTO peeps (body) VALUES('Another peep');")
  connection.exec("INSERT INTO peeps (body) VALUES('Hello');")

  visit('/peeps')

  expect(page).to have_content "My first peep"
  expect(page).to have_content "Another peep"
  expect(page).to have_content "Hello"
  end
end
