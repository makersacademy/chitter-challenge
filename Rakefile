require 'pg'

task :setup_test_database do 
  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.exec("TRUNCATE peeps, users;")
end

task :setup do
  p "Creating databases..."

  ['chitter_manager', 'chitter_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), email VARCHAR(60), password VARCHAR(60),UNIQUE(username, email));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, user_id INT, peep VARCHAR(280), created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (user_id) REFERENCES users(id));")
  end
end

task :teardown do
  ['chitter_manager', 'chitter_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database };")
  end
end
