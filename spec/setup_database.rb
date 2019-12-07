def setup_database
  @connection = PG.connect(dbname: 'chitter_test')
  @connection.exec("TRUNCATE TABLE users")
end