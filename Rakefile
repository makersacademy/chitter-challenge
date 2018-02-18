require 'pg'
require "./lib/database_connection"

task :setup do
  # p "Databases being created..."
  connection = PG.connect
  %w[chitter chitter_test].each do |database|
    connection.exec("CREATE DATABASE #{database}")
    DatabaseConnection.setup(database.to_s)
    DatabaseConnection.query('CREATE TABLE peeps (id SERIAL PRIMARY KEY, time timestamp DEFAULT CURRENT_TIMESTAMP, peep VARCHAR(280));')
    DatabaseConnection.query('CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(140), username VARCHAR(140), email VARCHAR(254), password VARCHAR(140));')
  end
  # p "Complete"
end

task :setup_test_database do
  # p "Test database being created..."
  DatabaseConnection.setup("chitter_test")
  DatabaseConnection.query("TRUNCATE users, peeps;
  INSERT INTO peeps (peep) VALUES('This is my first ever peep!');
  INSERT INTO peeps (peep) VALUES('This is my second peep!');
  INSERT INTO peeps (peep) VALUES('This is my third peep!');
  INSERT INTO users (name, username, email, password) VALUES('Serena', 'SerenaH', 'Serena@example.com', 'Serena@1234');")
end

task :drop_databases do
  # p "Databases being dropped..."
  connection = PG.connect
  %w[chitter chitter_test].each do |database|
    connection.exec("DROP DATABASE #{database}")
  end
  # p "Databases dropped"
end
