require 'pg'

p "setting up test database"

connection = PG.connect(dbname: 'chitter_test')
connection.exec("TRUNCATE chits")
