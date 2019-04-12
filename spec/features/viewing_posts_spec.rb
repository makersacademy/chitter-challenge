feature 'Viewing posts' do
  scenario 'User can see posts' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO posts VALUES (1, 'this is a test');")
    connection.exec("INSERT INTO posts VALUES (2, 'this is also a test');")

    visit('/posts')

    expect(page).to have_content "this is a test"
    expect(page).to have_content "this is also a test"
  end
end
