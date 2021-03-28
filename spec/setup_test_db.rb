require 'database_connection'

def setup_test_db
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("DROP TABLE IF EXISTS messages;")
  DatabaseConnection.query("DROP TABLE IF EXISTS users;")
  DatabaseConnection.query("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), email VARCHAR(60), password VARCHAR(60));")
  DatabaseConnection.query("CREATE TABLE messages(id SERIAL PRIMARY KEY, text VARCHAR(240), time TIMESTAMP, users_id INTEGER REFERENCES users (id));")
  # Test database preloaded with users and messages to save lines of code + standardise tests
  DatabaseConnection.query("INSERT INTO users(name, username, email, password) VALUES ('Taran', 'taran314', 'tarandeep-nandhra@hotmail.co.uk', 'taranisthebest');")
  DatabaseConnection.query("INSERT INTO users(name, username, email, password) VALUES ('Zena', 'zeezee', 'zena.choi@hotmail.co.uk', 'taranisthebest');")
  DatabaseConnection.query("INSERT INTO messages(text, time, users_id) VALUES ('Taran is the best', '2021-01-01 09:12:01', '1');")
  DatabaseConnection.query("INSERT INTO messages(text, time, users_id) VALUES ('cuteeee', '2021-01-05 07:12:01', '2');")
  DatabaseConnection.query("INSERT INTO messages(text, time, users_id) VALUES ('Windows > Mac', '2021-01-05 08:12:01', '1');")
  DatabaseConnection.query("INSERT INTO messages(text, time, users_id) VALUES ('Cats are cute', '2021-01-01 10:12:01', '2');")
end
