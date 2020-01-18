def setup_test_database
  require 'pg'
  p "test database being cleared"
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE messages;')
end