require 'pg'

def test_database_setup

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("DROP TABLE peeps;")

  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(60), created_at VARCHAR(60));")
end
