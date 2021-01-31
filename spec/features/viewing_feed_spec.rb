feature 'show feed' do
  scenario 'I want to be able to see feed of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO chitter VALUES(1, 'this is my first peep');")
    connection.exec("INSERT INTO chitter VALUES(2, 'this is my second peep');")
    connection.exec("INSERT INTO chitter VALUES(3, 'this is my third peep');")

    visit('/')

    expect(page).to have_content 'this is my first peep'
    expect(page).to have_content 'this is my second peep'
    expect(page).to have_content 'this is my third peep'

  end
end
