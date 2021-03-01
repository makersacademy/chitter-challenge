require 'pg'

def setup_test_database

  p "setting up the test database..."

  connection = PG.connect(dbname: 'peep_manager_test')

  #Clears the peeps table
  connection.exec("TRUNCATE peeps, users;")

end
