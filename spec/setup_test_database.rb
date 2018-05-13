require 'pg'

con = PG.connect(dbname: 'chitter_manager_test')
con.exec("TRUNCATE chitter;")
