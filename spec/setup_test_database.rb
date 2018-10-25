require 'pg'
con = PG.connect :dbname => 'chitter_test'
rs = con.exec "TRUNCATE TABLE peeps"
rs = con.exec "INSERT INTO peeps (id, text, name, username) VALUES(1, 'My first peep', 'Imogen Misso', 'imogenmisso123')"
