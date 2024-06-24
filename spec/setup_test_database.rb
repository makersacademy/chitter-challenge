require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('DROP TABLE users, peeps;')
  connection.exec('CREATE TABLE users (user_id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), email  VARCHAR(60), password VARCHAR(60));')
  connection.exec('CREATE TABLE peeps (peep_id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(user_id), create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, body VARCHAR(280));')
end