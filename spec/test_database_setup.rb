require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')

# Clear the database
connection.exec("TRUNCATE peeps;")


connection.exec("INSERT INTO peeps VALUES(1, 'My 1st peep');")
connection.exec("INSERT INTO peeps VALUES (2, 'My 2nd peep');")
connection.exec("INSERT INTO peeps VALUES (3, 'My 3rd peep');")
