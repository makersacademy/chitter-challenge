
require 'pg'
def setup_test_database 
connection = PG.connect(dbname: 'chitter_test')

# Clear the chitter table
connection.exec("TRUNCATE chitter;")
end
