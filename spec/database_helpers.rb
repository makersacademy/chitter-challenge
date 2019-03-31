require 'pg'

def test_db_setup
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("DROP TABLE posts")
  conn.exec("DROP TABLE users")
  conn.exec("CREATE TABLE posts(id SERIAL PRIMARY KEY, post VARCHAR(280), timestamp TIMESTAMPTZ default current_timestamp);")
  conn.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(100), username VARCHAR(20), email VARCHAR(50), password VARCHAR(25));")
end
