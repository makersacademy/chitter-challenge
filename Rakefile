require 'pg'
require 'rake'

task :test_environment do
  p 'Cleaning database...'

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the database
  connection.exec('TRUNCATE TABLE peeps;')
  connection.exec('TRUNCATE TABLE account;')
  connection.exec('ALTER SEQUENCE account_id_seq RESTART WITH 1')
  connection.exec('ALTER SEQUENCE peeps_id_seq RESTART WITH 1')

  p 'Setting up test environment...'

  # Add the test data
  connection.exec("INSERT INTO peeps (date, tweet) VALUES('2016-01-02 10:00:00', 'this is a peep');")
  connection.exec("INSERT INTO peeps (date, tweet) VALUES('2017-01-02 11:00:00', 'this is another peep');")
  connection.exec("INSERT INTO peeps (date, tweet) VALUES('2018-01-02 12:00:00', 'not another one');")

  connection.exec("INSERT INTO account (name) VALUES('Alex');")
  connection.exec("INSERT INTO account (name) VALUES('Zac');")
  connection.exec("INSERT INTO account (name) VALUES('Basil');")

end

task :setup do
  p 'Creating databases...'

  %w[chitter chitter_test].each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec('CREATE TABLE peeps(id SERIAL PRIMARY KEY, date timestamp DEFAULT current_timestamp, tweet VARCHAR(100));')
    connection.exec('CREATE TABLE account(id SERIAL PRIMARY KEY, name VARCHAR(100));')
  end
end

task :empty do
  p 'Removing existing databases...'
  %w[chitter chitter_test].each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec("DROP DATABASE #{database};")
  end
end
