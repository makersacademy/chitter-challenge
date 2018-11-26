def setup_test_database

  require 'pg'

  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the database tables
  connection.exec("TRUNCATE peeps;")
  connection.exec("TRUNCATE users;")

end
