feature 'List all users' do
  scenario 'List Chitters' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO users VALUES(1, 'Ngai Sui', 'jess', 'jess@chitter.com', 'borntochit');")

    visit('/users')

    expect(page).to have_content "jess"

  end
end
