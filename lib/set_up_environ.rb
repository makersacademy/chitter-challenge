require 'pg'

p "Setting up testing enviroment..."

connect = PG.connect :dbname => 'peep_manager_test'

connect.exec("TRUNCATE peeps;")
connect.exec("INSERT INTO peeps VALUES(DEFAULT, 'The night I lost CTRL');")
connect.exec("INSERT INTO peeps VALUES(DEFAULT, 'Byte me!');")
connect.exec("INSERT INTO peeps VALUES(DEFAULT, 'SQL Clause is coming to town');")
