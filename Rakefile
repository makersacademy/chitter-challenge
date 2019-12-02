if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do

  # Creates a new database called 'my_database':
  connection = PG.connect
  connection.exec('CREATE DATABASE chitter;')

  # Creates a table in the database called 'chitter' and adds the required
  # columns:
  connection = PG.connect :dbname => 'chitter';
  connection.exec(
    'CREATE TABLE peeps (id SERIAL PRIMARY KEY, date DATE, time TIME, username VARCHAR(20), post VARCHAR(140));'
  )
  connection.exec(
    'CREATE TABLE users (id SERIAL PRIMARY KEY, datetime TIMESTAMP, first_name VARCHAR(20), last_name VARCHAR(20), username VARCHAR(20), password VARCHAR(60));'
  )

  connection = PG.connect
  connection.exec('CREATE DATABASE chittertest;')

  # Creates a table in the database called 'chittertest' and adds the required
  # columns:
  connection = PG.connect :dbname => 'chittertest';
  connection.exec(
    'CREATE TABLE peeps (id SERIAL PRIMARY KEY, date DATE, time TIME, username VARCHAR(20), post VARCHAR(140));'
  )
  connection.exec(
    'CREATE TABLE users (id SERIAL PRIMARY KEY, datetime TIMESTAMP, first_name VARCHAR(20), last_name VARCHAR(20), username VARCHAR(20), password VARCHAR(60));'
  )

end

# Input data into database on local machine:

# task :seed_db do
#
#   # Connects to 'my_database' and inserts data into the 'my_table' table:
#   connection = PG.connect :dbname => 'my_database';
#   connection.exec ("INSERT INTO my_table VALUES (1, 'text1', 'text2', 01, 02);")
#
# end
