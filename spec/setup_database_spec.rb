require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter')
  connection.exec("TRUNCATE peeps;")
end
