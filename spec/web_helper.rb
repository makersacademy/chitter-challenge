require 'pg'

def setup_test_database
  p "Setting up test database..."

  conn = PG.connect(dbname: 'chitter_challenge_test')

  conn.exec("TRUNCATE peeps;")
  conn.exec("TRUNCATE users")
end

def sign_up
  visit '/'
  fill_in 'username', with: 'seven'
  fill_in 'password', with: 'secrets'
  click_button 'submit'
end 
