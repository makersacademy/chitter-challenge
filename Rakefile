if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'pg'

task :seed_test_db do
  connection = PG.connect :dbname => 'chitter_test'
  connection = PG.connect :dbname => 'contact_book_test'
  connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, poster VARCHAR(60), time VARCHAR(150), content VARCHAR(120));')
  connection.exec ("INSERT INTO peeps (poster, time, content) VALUES ('ChitterBot', '01-01-18 00:00:00', 'Hello World!');")
  connection.exec ("INSERT INTO peeps (poster, time, content) VALUES ('ChitterBot', '01-01-18 00:01:00', 'Can somebody make me a cup of tea?');")
  end

task :setup do
  connection = PG.connect
  connection.exec('CREATE DATABASE chitter;')
  connection.exec('CREATE DATABASE chitter_test;')

  connection = PG.connect :dbname => 'chitter'
  connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, poster VARCHAR(60), time VARCHAR(150), content VARCHAR(120));')
  connection.exec ("INSERT INTO peeps (poster, time, content) VALUES ('ChitterBot', '01-01-18 00:00:00', 'Hello World!');")
  connection.exec ("INSERT INTO peeps (poster, time, content) VALUES ('ChitterBot', '01-01-18 00:01:00', 'Can somebody make me a cup of tea?');")

  connection = PG.connect :dbname => 'chitter_test'
  connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, poster VARCHAR(60), time VARCHAR(150), content VARCHAR(120));')
  connection.exec ("INSERT INTO peeps (poster, time, content) VALUES ('ChitterBot', '01-01-18 00:00:00', 'Hello World!');")
  connection.exec ("INSERT INTO peeps (poster, time, content) VALUES ('ChitterBot', '01-01-18 00:01:00', 'Can somebody make me a cup of tea?');")
end

task :teardown do
  connection = PG.connect
  connection.exec('DROP DATABASE chitter;')
  connection.exec('DROP DATABASE chitter_test')
end
