require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

# Clear the peeps table
  connection.exec("TRUNCATE peeps;")
end
