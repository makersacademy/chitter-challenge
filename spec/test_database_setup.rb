require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE peeps;")

connection.exec("INSERT INTO peeps VALUES(1, 'how are you people?');")
connection.exec("INSERT INTO peeps VALUES(2, 'bored at home');")
