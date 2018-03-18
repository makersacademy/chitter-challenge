require 'pg'
p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE peeps;")

connection.exec("INSERT INTO peeps VALUES('Chiaki', 'chiakimz', 'peep1', '2016-06-22 19:10:25');")
connection.exec("INSERT INTO peeps VALUES('Chiaki', 'chiakimz', 'peep2', '2016-06-22 19:10:25');")
connection.exec("INSERT INTO peeps VALUES('Chiaki', 'chiakimz', 'peep3', '2016-06-22 19:10:25');")
