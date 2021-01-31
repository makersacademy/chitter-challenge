require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clean the chitter table
  connection.exec("TRUNCATE peeps;")
end