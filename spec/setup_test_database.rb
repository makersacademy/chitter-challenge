require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter-test')
  # drop existing tables
  connection.exec("DROP TABLE IF EXISTS peeps;")
  connection.exec("DROP TABLE IF EXISTS users;")
  # create new tables.
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(24), username VARCHAR(12), email VARCHAR(24), password VARCHAR(128))")
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, poster_id INTEGER references users(id) DEFAULT 1, peep_content VARCHAR(160), posted_at TIMESTAMP)")
  connection.exec("INSERT INTO users VALUES(1, 'Burrito', 'burrito', 'burrito@catbowl.com', 'fish123')")
  connection.exec("INSERT INTO peeps VALUES(DEFAULT, 1, 'Hello, Chitter!', current_timestamp)")
  connection.exec("INSERT INTO users VALUES(2, 'Larry', 'Larry', 'larry@catbowl.com', 'mouse123')")
  connection.exec("INSERT INTO peeps VALUES(DEFAULT, 2, 'MEOW!!!', current_timestamp)")
end
