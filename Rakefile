if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :spec
  task default: [:spec]
end

require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_challenge_test')

  # Clear the database
  connection.exec("TRUNCATE peeps;")
  connection.exec("TRUNCATE users;")
end

task :setup do
  p "Creating databases..."

  connection = PG.connect
  connection.exec("CREATE DATABASE chitter_challenge;")
  connection.exec("CREATE DATABASE chitter_challenge_test;")

  connection = PG.connect(dbname: 'chitter_challenge')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, 
                      peep VARCHAR(140), 
                      username VARCHAR(60),
                      created_at TIMESTAMP DEFAULT current_timestamp(0)
                      );")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, 
                      email VARCHAR(60), 
                      password VARCHAR(140),
                      name VARCHAR(60), 
                      username VARCHAR(60)
                      );")

  connection = PG.connect(dbname: 'chitter_challenge_test')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, 
                    peep VARCHAR(140), 
                    username VARCHAR(60),
                    created_at TIMESTAMP DEFAULT current_timestamp(0)
                    );")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, 
                    email VARCHAR(60), 
                    password VARCHAR(140),
                    name VARCHAR(60), 
                    username VARCHAR(60)
                    );")
end

task :teardown do
  p "Destroying databases...type 'y' to confirm that you want to destroy the chitter_challenge databases. This will remove all data in those databases!"

  # Get a confirmation from the user!
  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['chitter_challenge', 'chitter_challenge_test'].each do |database|
    connection = PG.connect
    # Drop each database in the list
    connection.exec("DROP DATABASE #{database}")
  end
end
