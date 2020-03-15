def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_test')

  # clean the chitter tables
  connection.exec("TRUNCATE users, peeps;")
end
