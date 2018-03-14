require 'pg'
if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

# PG.connect(ENV['DATABASE_URL'])

task :test_database_setup do
  p 'Setting up test database...'
  connection = PG.connect(ENV['DATABASE_URL'] )
  connection.exec("TRUNCATE peeps, users, comments;")
  connection.exec("INSERT INTO peeps VALUES(1, 'Nice day for coding', '2018-02-17 15:54:04', 'Justyna');")
  connection.exec("INSERT INTO peeps VALUES(2, 'Bad day for coding', '2018-02-17 15:55:04', 'Igor');")
  connection.exec("INSERT INTO comments (text, peep_id) VALUES('lol', '1');")
end

task :setup do
  p "Creating databases..."
    connection = PG.connect(ENV['DATABASE_URL'])
    connection = PG.connect(ENV['DATABASE_URL'])
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(240), date TIMESTAMP, author VARCHAR(50));")
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(40), password VARCHAR(40), name VARCHAR(40), username VARCHAR(40));")
    connection.exec("CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), peep_id INTEGER REFERENCES peeps (id));")
end

task :teardown do
  p "Tearing down databases..."
    connection = PG.connect(ENV['DATABASE_URL'])
end
