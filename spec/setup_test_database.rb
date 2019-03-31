require 'pg'

# creating a method that sets up a connection to the test database and then clears it. 
def setup_test_database
  connection = PG.connect(dbname: 'chitter_manager_test')
  #this bit i.e. TRUNCATE clears the things held in peeps.
  connection.exec("TRUNCATE peeps;")
end
