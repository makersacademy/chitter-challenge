require 'pg'

def setup_test_database
  p "preparing for clearing data"
  connection = PG.connect(dbname: 'peeps_manager_test')
  connection.exec("TRUNCATE peeps;")
end