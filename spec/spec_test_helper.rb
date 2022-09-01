require 'pg'

def setup_test_database

  p 'setting up test database...'

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec('TRUNCATE chitts;')
  connection.exec('TRUNCATE accounts;')

end
