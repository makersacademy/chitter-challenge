require 'pg'

def test_database_setup

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("DROP TABLE peeps;")

  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(60), created_at VARCHAR(60));")

  connection.exec("DROP TABLE users;")

  connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(60), user_name VARCHAR(60), email VARCHAR(60), password VARCHAR(60));")
end
