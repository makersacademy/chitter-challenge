feature 'View all peeps in chronological order' do
  it 'homescreen displays peeps in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO post (content) VALUES('First Peep');")
    connection.exec("INSERT INTO post (content) VALUES('Second Peep');")
    visit('/')
    expect(page).to have_content 'Second Peep'
  end
end
