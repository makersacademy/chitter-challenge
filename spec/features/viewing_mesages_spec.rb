
feature 'Viewing messages' do
  scenario 'A user can see all the messages' do
    connection = PG.connect(dbname: 'Chitter_test')
    connection.exec("INSERT INTO messages (messages) VALUES('Welcome to Chitter');")

    visit('/messages')

    expect(page).to have_content "Welcome to Chitter"
  end
end
