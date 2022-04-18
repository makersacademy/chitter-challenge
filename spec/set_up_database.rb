require 'pg'

p "Setting up test database..."

connection = PGConn.open(dbname: 'chitter_test')

connection.exec("TRUNCATE chitter;")