feature 'PTest access to Chitter homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

feature 'Viewing Posts' do
  scenario 'A user can see Posts' do
    connection = PG.connect(dbname: 'chitter_db_test')

    connection.exec("INSERT INTO messages (peep, tag) VALUES ('It was a great week at Makers!', '@Br0ckers');")
    connection.exec("INSERT INTO messages (peep, tag) VALUES ('We learned about databases!', '@Br0ckers');")
    connection.exec("INSERT INTO messages (peep, tag) VALUES ('databases suck!', '@Br0ckers');")



    visit('/peeps')
    expect(page).to have_content 'It was a great week at Makers!', '@Br0ckers'
    expect(page).to have_content 'We learned about databases!', '@Br0ckers'
    expect(page).to have_content 'databases suck!', '@Br0ckers'
  end
end
