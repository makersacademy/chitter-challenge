require 'pg'

def truncate_test_tables
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE TABLE peeps;')
end