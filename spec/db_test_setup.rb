require 'pg'

def db_test_setup
  connection = PG.connect(dbname: 'chitter_db_test')
  connection.exec("TRUNCATE chitter;")
end
