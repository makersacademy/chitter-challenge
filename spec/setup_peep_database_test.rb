require 'pg'

def setup_peep_database_test
  connection = PG.connect(dbname: 'peeps_manager_test')
  connection.exec("TRUNCATE peeps;")
end
