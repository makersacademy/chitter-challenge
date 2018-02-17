require 'pg'
require "./lib/database_connection"

task :setup do
  p "Databases being created..."
  connection = PG.connect
  %w[chitter chitter_test].each do |database|
    connection.exec("CREATE DATABASE #{database}")
    DatabaseConnection.setup(database.to_s)
    DatabaseConnection.query('CREATE TABLE peeps (id SERIAL PRIMARY KEY, time Time, peep VARCHAR(280));')
  end
    p "Complete"
end

task :setup_test_database do
  p "Test database being created..."  
  DatabaseConnection.setup("chitter_test")
  DatabaseConnection.query("TRUNCATE peeps;
  INSERT INTO peeps (time, peep) VALUES('17:50', 'This is my first ever peep!');
  INSERT INTO peeps (time, peep) VALUES('18:50','This is my second peep!');
  INSERT INTO peeps (time, peep) VALUES('10:50','This is my third peep!');")
  p "Test database creation complete"    
end

task :drop_databases do
  p "Databases being dropped..."
  connection = PG.connect
  %w[chitter chitter_test].each do |database|
    connection.exec("DROP DATABASE #{database}")
  end
    p "Databases dropped"
end
