require 'pg'

p "Using test database."

con = PG.connect(dbname: 'chitter_test')
con.exec("TRUNCATE TABLE peeps;")
