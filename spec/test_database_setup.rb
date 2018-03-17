p "Setting up test database..."

require 'pg'

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE peeps;")

connection.exec("INSERT INTO peeps VALUES(1, 'My 0th test peep');")
connection.exec("INSERT INTO peeps VALUES(2, 'Another test peep');")
connection.exec("INSERT INTO peeps VALUES(3, 'The last test peep');")
