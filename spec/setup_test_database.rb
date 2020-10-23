require 'pg'

def setup_test_database
  print "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE all_peeps;")
end
