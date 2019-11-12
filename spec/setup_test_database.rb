require 'pg'

p "Setting up test database..."

def setup_test_database

connection = PG.connect(dbname: 'Chitter_test')

connection.exec("TRUNCATE messages;")

end
