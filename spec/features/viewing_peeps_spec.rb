feature 'Viewing peeps' do
  scenario 'Displaying all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps(post) VALUES('This is my first peep!');")
    connection.exec("INSERT INTO peeps(post) VALUES('This is my second peep!');")
    connection.exec("INSERT INTO peeps(post) VALUES('This is my third peep!');")

    visit('/')

    expect(page).to have_content 'This is my first peep!'
    expect(page).to have_content 'This is my second peep!'
    expect(page).to have_content 'This is my third peep!'
  end
end
