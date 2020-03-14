def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # clean the chitter tables
  connection.exec("TRUNCATE users;")
end
