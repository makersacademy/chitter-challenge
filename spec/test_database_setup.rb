require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')

# Clear the database
connection.exec("TRUNCATE peeps;")

connection.exec("INSERT INTO peeps VALUES (1, 'Test peep 1');")
connection.exec("INSERT INTO peeps VALUES (2, 'Test peep 2');")
connection.exec("INSERT INTO peeps VALUES (3, 'Test peep 3');")
