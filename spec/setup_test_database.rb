require 'pg' 

def setup_test_database

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("DROP TABLE IF EXISTS peeps;")
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(240), peeptime VARCHAR(25));")

end