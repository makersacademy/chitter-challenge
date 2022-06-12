require 'pg'

def setup_test_database
  p "Setting up test database..."

  conn = PG.connect(dbname: 'chitter_test')
  
  # Clear the accounts and peeps tables before running rspec
  conn.exec("TRUNCATE accounts CASCADE;")
end
