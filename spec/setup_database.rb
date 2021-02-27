require 'pg'

def setup_database
  connection = PG.connect(dbname: 'peep_manager_test')

  connection.exec('TRUNCATE peeps, users;')
end
