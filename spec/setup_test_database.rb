require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter-test')
  # drop existing tables
  connection.exec("DROP TABLE IF EXISTS peeps;")
  connection.exec("DROP TABLE IF EXISTS users;")
  # create new tables.
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(12), email VARCHAR(24), password VARCHAR(128))")
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, poster_id INTEGER references users(id), peep_content VARCHAR(160), posted_at TIMESTAMP)")
  connection.exec("INSERT INTO users VALUES(1, 'burrito', 'burrito@catbowl.com', 'fish123')")
end
