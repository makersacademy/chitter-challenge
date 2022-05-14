feature 'Displays messages' do
  scenario 'shows the messages' do
    connection = PG.connect(dbname: 'messages_test')
    connection.exec("INSERT INTO messages (content) VALUES ('Message one, blah blah');")
    connection.exec("INSERT INTO messages (content) VALUES ('Message two, blah blah blah');")

    visit('/messages')
    expect(page).to have_content "Message one, blah blah"
    expect(page).to have_content "Message two, blah blah blah"
  end
end