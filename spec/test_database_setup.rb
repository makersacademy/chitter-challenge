p "Setting up test database..."

require 'pg'

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE peeps;")

connection.exec("INSERT INTO peeps VALUES(1, 'This is a test peep');")
connection.exec("INSERT INTO peeps VALUES(2, 'This is another test peep');")
