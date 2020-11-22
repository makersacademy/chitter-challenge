require 'pg'

task :test_database_setup do
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE users, peeps;")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(15), email VARCHAR(60), password VARCHAR(140));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, body TEXT, datetimeposted timestamp default CURRENT_TIMESTAMP, user_id INTEGER REFERENCES users (id) ON DELETE CASCADE);")
  end
end