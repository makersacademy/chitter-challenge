require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test', user: 'postgres', password: 'postgres')
  connection.exec("TRUNCATE peeps;")
end
