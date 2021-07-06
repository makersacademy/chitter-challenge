require 'pg'


def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the tables
  connection.exec("TRUNCATE users, peeps, tags;")
end
