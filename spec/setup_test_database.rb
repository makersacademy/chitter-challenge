require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'peep_manager_test')

  # Clean the peeps table
  connection.exec("TRUNCATE peeps;")
end