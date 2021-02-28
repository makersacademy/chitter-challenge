require 'pg'

def setup_test_database

p "setting up the test database..."

connection = PG.connect(dbname: 'peep_manager_test')

connection.exec("TRUNCATE peeps;")

end
