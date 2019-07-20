require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'peeps_manager_test')
  connection.exec("TRUNCATE peeps;")
end
