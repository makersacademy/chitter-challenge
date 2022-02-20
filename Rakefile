require 'pg'

task :default => [:setup]

desc "Resets the test database"
task :test_database_setup do
  p "Resetting database..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the database
  connection.exec("TRUNCATE users RESTART IDENTITY CASCADE;")
end

desc "Creates the test and app databases if they do not exist"
task :setup do

  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    p "Connecting to user default database"
    connection = PG.connect
    result = connection.exec("SELECT 1 AS result from pg_database WHERE datname='#{database}';")
    if !result.any?
      connection.exec("CREATE DATABASE #{ database };")
      connection = PG.connect(dbname: database)
      connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(280));")
      connection.exec("ALTER TABLE peeps ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT NOW();")
      connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));")
      connection.exec("ALTER TABLE users ADD COLUMN name VARCHAR(30) NOT NULL;")
      connection.exec("ALTER TABLE users ADD COLUMN user_name VARCHAR(30) UNIQUE NOT NULL;")
      connection.exec("ALTER TABLE users ADD CONSTRAINT email_unique UNIQUE (email);")
      connection.exec("ALTER TABLE users RENAME id TO user_id;")
      connection.exec("ALTER TABLE peeps ADD COLUMN user_id INT NOT NULL;")
      connection.exec("ALTER TABLE peeps ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users(user_id);")
      connection.exec("ALTER TABLE peeps ADD COLUMN parent_peep_id INT NULL;")
      connection.exec("ALTER TABLE peeps RENAME id TO peep_id")
      p "#{database} created."
    else
      p "#{database} already exists."
    end
  end
end