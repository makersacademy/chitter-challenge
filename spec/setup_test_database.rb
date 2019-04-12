def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE users, peers;")

  # Add the rewuired bookmarks to the tests
  connection.exec("INSERT INTO users VALUES(1, 'test@test.com', 'password123', 'Test Tester', 'Tester');")
  connection.exec("INSERT INTO peers VALUES(1, 1, 'First test peer', DEFAULT);")
  # connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'Destroy all Software');")
  # connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")
end
