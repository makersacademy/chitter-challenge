require 'pg'
con = PG.connect :dbname => 'chitter'
rs = con.exec "TRUNCATE TABLE peeps"
