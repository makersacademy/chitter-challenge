require 'pg'

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE peeps;")

connection.exec("INSERT INTO peeps (peep) VALUES ('What a beautiful morning!');")
connection.exec("INSERT INTO peeps (peep) VALUES ('Back on terra firma.');")
connection.exec("INSERT INTO peeps (peep) VALUES ('Free as a bird.');")
