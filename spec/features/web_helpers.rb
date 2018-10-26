def add_test_cheets
  conn = PG.connect(dbname: 'chitter_database_test')
  conn.exec("INSERT INTO cheets (cheet) VALUES ('My first cheet'), ('My second cheet');")
end

def clear_test_db
  conn = PG.connect(dbname: 'chitter_database_test')
  conn.exec("TRUNCATE cheets")
  conn.exec("TRUNCATE auth")
end

def create_account(user, name = "John")
  visit '/'
  click_button 'Register'
  fill_in('Name', with: "#{name}")
  fill_in('Username', with: "#{user}")
  fill_in('Password', with: 'password')
  fill_in('Confirm_Password', with: 'password')
  fill_in('Email', with: 'my@email.com')
  click_button 'Submit'
end
