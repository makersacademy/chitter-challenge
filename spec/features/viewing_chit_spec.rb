require 'pg'

feature 'Viewing chats' do
  scenario 'A user can see chats' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO chit VALUES(1, 'Hey my first chit');")
    connection.exec("INSERT INTO chit VALUES(2, 'Look pops, I am chitting');")
    connection.exec("INSERT INTO chit VALUES(3, 'Wassup!');")

    visit('/chitter')

    expect(page).to have_content "Hey my first chit"
    expect(page).to have_content "Look pops, I am chitting"
    expect(page).to have_content "Wassup!"
  end
end