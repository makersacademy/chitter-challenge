feature 'viewing messages' do
  scenario 'user can see posted messages' do
    con = PG.connect(dbname: 'chitter_test')

    con.exec("INSERT INTO posts VALUES(1, 'This is my first peep.');")
    con.exec("INSERT INTO posts VALUES(2, 'This is my second peep.');")
    con.exec("INSERT INTO posts VALUES(3, 'This is my third peep.');")

    visit '/peep'

    expect(page).to have_content 'This is my first peep'
    expect(page).to have_content 'This is my second peep'
    expect(page).to have_content 'This is my third peep'
  end
end
