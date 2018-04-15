require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task :test_db do

    con = PG.connect(dbname: 'chitter_test')
    con.exec("TRUNCATE TABLE peeps RESTART IDENTITY;")
    con.exec("TRUNCATE TABLE users RESTART IDENTITY;")

  end

  task :setup do
    con = PG.connect
    con.exec('CREATE DATABASE chitter;')
    con.exec('CREATE DATABASE chitter_test;')

    con = PG.connect(dbname: 'chitter')
    con.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, username VARCHAR(15), message VARCHAR(150), time VARCHAR(60));')
    con.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(15), email VARCHAR(60), username VARCHAR(15), password VARCHAR(20));')

    con = PG.connect(dbname: 'chitter_test')
    con.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, username VARCHAR(15), message VARCHAR(150), time VARCHAR(60));')
    con.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(15), email VARCHAR(60), username VARCHAR(15), password VARCHAR(20));')
  end

  task :travis_setup do
    p "Creating test database..."

   ['chitter_test'].each do |database|
     connection = PG.connect
     connection.exec("CREATE DATABASE #{database};")
     connection = PG.connect(dbname: database)
     connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140), user_name VARCHAR(80));")
     connection.exec("CREATE TABLE posts(id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users (id), message VARCHAR(240), created_at TIMESTAMP DEFAULT now());")
    end
  end
end
