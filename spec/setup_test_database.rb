require 'pg'

def setup_test_database
connection = PG.connect(dbname: 'chit_manager_test')

# this clears the chits table
connection.exec("TRUNCATE chits;")
end