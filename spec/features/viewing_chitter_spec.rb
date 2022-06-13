feature 'Viewing Chitter' do
  scenario 'A user can see all comments' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO chat_log (chat_log) VALUES ('Hello!');")
    connection.exec("INSERT INTO chat_log (chat_log) VALUES ('That is fun!');")
    connection.exec("INSERT INTO chat_log (chat_log) VALUES('Please go on!');")

    visit('/chitter')

    expect(page).to have_content "Hello"
    expect(page).to have_content "That is fun!"
    expect(page).to have_content "Please go on!"
  end
end
