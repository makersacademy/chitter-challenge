
require 'pg'
require 'rake'

task :test_setup do
  p 'Cleaning database...'

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the database
  connection.exec('TRUNCATE TABLE peeps;')

  p 'Setting up test environment...'

  # Add the test data
  connection.exec("INSERT INTO peeps (ts, message) VALUES('2016-01-02 10:00:00', 'My 0th test peep');")
  connection.exec("INSERT INTO peeps (ts, message) VALUES('2017-01-02 11:00:00', 'Another test peep');")
  connection.exec("INSERT INTO peeps (ts, message) VALUES('2018-01-02 12:00:00', 'The last test peep');")

end

task :setup do
  p 'Creating databases...'

  %w[chitter chitter_test].each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec('CREATE TABLE peeps(id SERIAL PRIMARY KEY, ts TIMESTAMP DEFAULT now(), message VARCHAR(60));')
  end
end

task :empty do
  p 'Removing existing databases...'
  %w[chitter chitter_test].each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec("DROP DATABASE #{database};")
  end
end
