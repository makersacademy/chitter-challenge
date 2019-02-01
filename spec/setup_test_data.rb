require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_testing')
  connection.exec("TRUNCATE peeps")
end
