def setup_test_database
  p "set up database.. "
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")
ensure
  connection.close if connection
end