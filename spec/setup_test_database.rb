require 'pg'

def setup_test_database
  p "Setting up test database..."

connection = PG.connect(dbname: 'cheeps_test_database')

connection.exec("TRUNCATE cheeps;")

end

