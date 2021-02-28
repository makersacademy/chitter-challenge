def setup_test_database
  p "setting up the test database"
  connection = PG.connect(dbname: "peeps_test")
  connection.exec("TRUNCATE peeps;")
  connection.exec("TRUNCATE users;")
  connection.exec("TRUNCATE logins;")
end
