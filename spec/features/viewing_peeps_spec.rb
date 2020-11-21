feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end

  scenario 'A maker can see peeps' do
    connection = PG.connect(dbname: 'chitter_challenge_test')

    connection.exec("INSERT INTO accounts (forename,surname,username,email,password) VALUES ('Lucy','Stringer','stringiest','lucyjstringer@gmail.com','password123');")
    connection.exec("INSERT INTO accounts (forename,surname,username,email,password) VALUES ('Sam','Morgan','sjmog','samm@makersacademy.com','password123');")

    connection.exec("INSERT INTO peeps (script,created_on,created_at,account_id) VALUES ('This is my first peep','20201121','16:40',(SELECT account_id FROM accounts WHERE username='stringiest'));")
    connection.exec("INSERT INTO peeps (script,created_on,created_at,account_id) VALUES ('Why have you used my identity?','20201121','16:40',(SELECT account_id FROM accounts WHERE username='sjmog'));")

    visit('/peeps')

    expect(page).to have_content 'This is my first peep'
    expect(page).to have_content 'Why have you used my identity?'
  end
end
