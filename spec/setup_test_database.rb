def setup_test_database
  DatabaseConnection.query('TRUNCATE users CASCADE')

  DatabaseConnection.query("INSERT INTO users VALUES (1, 'testperson1', 'password', 'email@email.com')")
end
