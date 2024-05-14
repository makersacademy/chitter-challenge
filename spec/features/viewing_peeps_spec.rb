feature 'viewing peeps' do
  scenario 'seee peeps in homepage' do
    con = PG.connect(dbname: 'chitter_test')

    con.exec("INSERT INTO PEEPS (url) VALUES ('Hello chitter users');")
    con.exec("INSERT INTO PEEPS (url) VALUES ('This is my first peep');")

    visit('/')

    expect(page).to have_content 'Hello chitter users'
    expect(page).to have_content 'This is my first peep'
  end
end
