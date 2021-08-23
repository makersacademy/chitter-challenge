require 'pg'

def setup_test_database

connection = PG.connect(dbname: 'chitter_test') #connect to test database

connection.exec("TRUNCATE peeps;") #command to empty the datable

end