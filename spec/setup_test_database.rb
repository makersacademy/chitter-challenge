require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE peeps;")
