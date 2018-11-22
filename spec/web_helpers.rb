def db_connection
  connection = 'chitter'
  connection = 'chitter_test' if ENV['ENVIRONMENT'] == 'test'
  db = PG.connect(dbname: connection)
end

def setup_database
  db_connection.exec('TRUNCATE peeps')
end
