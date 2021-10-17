def setup_test_database
  connection = PG.connect(dbname: 'peeps_test')

  connection.exec("TRUNCATE peeps, userdb;")
end
