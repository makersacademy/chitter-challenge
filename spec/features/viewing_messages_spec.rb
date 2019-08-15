feature 'viewing messages' do
  scenario 'visiting the index page' do

    visit('/')

    expect(page).to have_content "Hello Chitter"
  end

  scenario 'a user can see messages' do
    connection = PG.connect(dbname: 'chitter_test')


    connection.exec("INSERT INTO messages VALUES(1,'Hello');")
    connection.exec("INSERT INTO messages VALUES(2,'How are you?');")
    connection.exec("INSERT INTO messages VALUES(3,'Ruby is fantastic!');")

    visit('/messages')

    expect(page).to have_content "Hello"
    expect(page).to have_content "How are you?"
    expect(page).to have_content "Ruby is fantastic!"
  end
end