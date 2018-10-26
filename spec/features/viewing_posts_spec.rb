feature 'Viewing posts' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter!"
  end

  scenario 'seeing posts on page' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO messages (content) VALUES ('This is a test message');")
    connection.exec("INSERT INTO messages (content) VALUES('This is a second test message');")

    visit('/')
    expect(page).to have_content 'This is a test message'
    expect(page).to have_content 'This is a second test message'
  end
end
