require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'test_chitter')
  connection.exec("TRUNCATE chitter;")
end