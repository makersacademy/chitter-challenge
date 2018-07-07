require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'blabber_test')
  connection.exec('TRUNCATE TABLE blabs;')
end
