require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'Chitter_Manager_Test')
  connection.exec("TRUNCATE peeps, users;")
  connection.exec("INSERT INTO peeps (peep) VALUES('HELLO');")
  connection.exec("INSERT INTO peeps (peep) VALUES('This is my second peep');")
end
