require 'pg'

p "Setting up database...🔧 "
connection = PG.connect(dbname: 'chitter_test')
connection.exec("TRUNCATE peeps;")
