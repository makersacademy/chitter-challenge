require 'pg'

feature 'viewing chitter' do
  scenario 'a user can see messages' do
    connection = PG.connect(dbname: 'chitter_messenger_test')

    connection.exec("INSERT INTO messages VALUES(1, 'I love Chitter!');")
    connection.exec("INSERT INTO messages VALUES(2, 'How do I peep?');")
    connection.exec("INSERT INTO messages VALUES(3, 'This is so fun.');")

    visit('/messages')

    expect(page).to have_content "I love Chitter!"
    expect(page).to have_content "How do I peep?"
    expect(page).to have_content "This is so fun."

  end

end
