if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  # require 'dm-core'
  # require './lib/data_mapper_setup'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]

  connection.exec("TRUNCATE peeps;")
  connection.exec("TRUNCATE users;")
end

task :test_setup do
  p "Cleaning databases..."

  connection = PG.connect
  connection.exec("CREATE DATABASE chitter;")
  connection.exec("CREATE DATABASE chitter_test;")

  connection = PG.connect(dbname: 'chitter')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, 
                      peep VARCHAR(188), 
                      username VARCHAR(60),
                      created_at TIMESTAMP DEFAULT current_timestamp(0)
                      );")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, 
                      email VARCHAR(60), 
                      password VARCHAR(32),
                      name VARCHAR(60), 
                      username VARCHAR(60)
                      );")

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, 
                    peep VARCHAR(188), 
                    username VARCHAR(60),
                    created_at TIMESTAMP DEFAULT current_timestamp(0)
                    );")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, 
                    email VARCHAR(60), 
                    password VARCHAR(32),
                    name VARCHAR(60), 
                    username VARCHAR(60)
                    );")
end

task :teardown do
  p "Destroying databases...type 'y' to confirm that you want to destroy the chitter_challenge databases. This will remove all data!"

  # Get a confirmation from the user!
  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    # Drop each database in the list
    connection.exec("DROP DATABASE #{database}")
  end

  # task :auto_upgrade do
  #   DataMapper.auto_upgrade!
  #   puts 'Auto-upgrade complete. Data is safe and sound.'
  # end
   
  # task :auto_migrate do
  #   DataMapper.auto_migrate!
  #   puts 'Auto-migrate complete. Data could have been lost.'
  # end
end
