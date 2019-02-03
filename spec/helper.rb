require 'pg'

def truncate_test_db
  connection = PG.connect(dbname: 'chitter_challenge_test')
  connection.exec('DROP TABLE peeps, users')
  connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(140), name VARCHAR(100), username VARCHAR(100), password VARCHAR(200))')
  connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, text VARCHAR(140), time VARCHAR(100), user_id INTEGER REFERENCES users (id))')
end
