feature 'Viewing posts' do
  scenario 'check there are posts listed' do
    con = PG.connect :dbname => 'chitter_test'

    con.exec("INSERT INTO posts VALUES(1, 'Test chit 01');")
    con.exec("INSERT INTO posts VALUES(2, 'Test chit 02');")
    con.exec("INSERT INTO posts VALUES(3, 'Test chit 03');")

    visit('/posts')

    expect(page).to have_content "Test chit 01"
    expect(page).to have_content "Test chit 02"
    expect(page).to have_content "Test chit 03"
  end
end
