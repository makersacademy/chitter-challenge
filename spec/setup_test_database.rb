require 'pg'
def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")

  connection = PG.connect(dbname: 'user_database_test')
  connection.exec("TRUNCATE users;")

end

