require 'pg'

def setup_test_database
p 'Setting up test database...'

connection = PG.connect(dbname: 'peeps_manager_test')

# Clears the peeps table
connection.exec("TRUNCATE peeps;")
end