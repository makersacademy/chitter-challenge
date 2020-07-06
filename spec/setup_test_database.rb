require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_app_test')

  # Clear tables in chitter_app_test
  connection.exec("TRUNCATE users, peeps;")
end
