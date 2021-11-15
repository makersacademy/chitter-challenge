require 'pg'

p "Set up test database"

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE peeps;")