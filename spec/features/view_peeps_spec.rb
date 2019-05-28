feature 'view peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chit_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'My first peep!');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Hello, World');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Let me tell you something about Chitter..');")

    visit('/peeps')

    expect(page).to have_content "My first peep!"
    expect(page).to have_content "Hello, World"
    expect(page).to have_content "Let me tell you something about Chitter.."
  end
end
