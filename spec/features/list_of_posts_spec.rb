feature 'Posts' do
  scenario 'user can see a list of posts' do
    connection = PG.connect(dbname: 'chitter_db_test')

    connection.exec("INSERT INTO chitter (message) VALUES ('1st post');")
    connection.exec("INSERT INTO chitter (message) VALUES('2nd post');")
    connection.exec("INSERT INTO chitter (message) VALUES('3rd post');")

    visit '/chitter'
    expect(page).to have_content "1st post"
    expect(page).to have_content "2nd post"
    expect(page).to have_content "3rd post"
  end
end
