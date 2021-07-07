def setup_test_database
  DatabaseConnection.query('TRUNCATE users CASCADE')

  DatabaseConnection.query("INSERT INTO users VALUES (1, 'testperson1', 'password', 'email@email.com')")

  DatabaseConnection.query("INSERT INTO peeps VALUES ('chitter 1', 1, '2020-04-01 16:30:01', 1)")
  DatabaseConnection.query("INSERT INTO peeps VALUES ('chitter 2', 1, '2020-04-01 13:30:01', 2)")
end
