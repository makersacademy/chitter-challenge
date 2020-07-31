def wipe_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps RESTART IDENTITY;")
  connection.exec("TRUNCATE users RESTART IDENTITY;")
end
