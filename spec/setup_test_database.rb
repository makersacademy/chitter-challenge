require 'pg'

p "Setting up a database..."

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE peeps;")
