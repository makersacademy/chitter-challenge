require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE chitter_db;")
end

def setup_test_account_database
  p "Setting up test account database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE chitter_account;")
end
