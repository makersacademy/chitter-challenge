require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :remove_databases do
  connection = PG.connect
  connection.exec('DROP DATABASE IF EXISTS chitter')
  connection.exec('DROP DATABASE IF EXISTS chitter_test')
end


task :setup do
  connection = PG.connect
  connection.exec('CREATE DATABASE chitter')
  connection.exec('CREATE DATABASE chitter_test')

  connection = PG.connect :dbname => 'chitter'
  connection.exec('CREATE TABLE users ( id SERIAL PRIMARY KEY, name VARCHAR (24) NOT NULL, username VARCHAR (24) NOT NULL UNIQUE, password VARCHAR (24) NOT NULL, email VARCHAR (240) NOT NULL UNIQUE);')
  connection.exec("CREATE TABLE posts ( id SERIAL PRIMARY KEY, body VARCHAR (240), creation_date TIMESTAMP NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'), user_id INT REFERENCES users (id));")

  connection = PG.connect :dbname => 'chitter_test'
  connection.exec('CREATE TABLE users ( id SERIAL PRIMARY KEY, name VARCHAR (24) NOT NULL, username VARCHAR (24) NOT NULL UNIQUE, password VARCHAR (24) NOT NULL, email VARCHAR (240) NOT NULL UNIQUE);')
  connection.exec("CREATE TABLE posts ( id SERIAL PRIMARY KEY, body VARCHAR (240), creation_date TIMESTAMP NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'), user_id INT REFERENCES users (id));")

end
