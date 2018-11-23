def db_connection
  connection = 'chitter'
  connection = 'chitter_test' if ENV['ENVIRONMENT'] == 'test'
  db = PG.connect(dbname: connection)
end

def setup_database
  db = db_connection
  db.exec('TRUNCATE users')
end
