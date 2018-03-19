require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: %w[spec setup_db test_database_population]
end

# task default: %w[setup_db test_database_population]

task :setup_db do

  conn = PG.connect

  p 'Creating Databases...........'
  # creating new databases and tables if don't already exist
  ['chitter', 'chitter_test'].each do |db|
    conn = PG.connect

    # tries to create database
    begin
      conn.exec("CREATE DATABASE #{db};")
      conn = PG.connect(dbname: db)
      puts "Database #{db} created."
    rescue PG::Error => e
      puts e.message
    end

    #  tries to create tables
    begin
      conn.exec("create table peeps(
        id SERIAL PRIMARY KEY,
        user_id INT NOT NULL,
        peep VARCHAR(80) NOT NULL,
        date timestamp default current_timestamp);"
      )

      conn.exec("create table users(
        id SERIAL PRIMARY KEY,
        username VARCHAR(30) NOT NULL UNIQUE,
        password VARCHAR(50) NOT NULL,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email VARCHAR(320) NOT NULL UNIQUE
        );"
      )
      puts "Tables on #{db} created."
    rescue PG::Error => e
      puts e.message
    end
  end
end

task :test_database_population do
  p "clearing up and populating test database..."
  conn = PG.connect(dbname: 'chitter_test')

  # clearing up peeps table
  conn.exec("delete from peeps;")
  # repopulating peeps table
  conn.exec('ALTER SEQUENCE peeps_id_seq RESTART WITH 1;')
  conn.exec("INSERT INTO peeps (user_id, peep) VALUES(1,'This is first peep.'), (
  2,'This is second peep.')")
  # conn.exec("INSERT INTO peeps (user_id, peep) VALUES(2,'This is second peep.')")
  conn.exec("INSERT INTO peeps (user_id, peep) VALUES(1,'This is third peep.')")
  conn.exec("INSERT INTO peeps (user_id, peep) VALUES(3,'This is fourth peep.')")
  conn.exec("INSERT INTO peeps (user_id, peep) VALUES(4,'This is fifth peep.')")
  conn.exec("INSERT INTO peeps (user_id, peep) VALUES(2,'This is sixth peep.')")
  conn.exec("INSERT INTO peeps (user_id, peep) VALUES(1,'This is seventh peep.')")
  conn.exec("INSERT INTO peeps (user_id, peep) VALUES(3,'This is eigth peep.')")
  conn.exec("INSERT INTO peeps (user_id, peep) VALUES(1,'This is ninth peep.')")
  conn.exec("INSERT INTO peeps (user_id, peep) VALUES(4,'This is tenth peep.')")
  conn.exec("INSERT INTO peeps (user_id, peep) VALUES(3,'This is eleventh peep.')")

  # clearing up users table
  conn.exec("delete from users;")
  # repopulating users table
  conn.exec('ALTER SEQUENCE users_id_seq RESTART WITH 1;')
  conn.exec("INSERT INTO users (username, password, first_name, last_name, email) VALUES ('duranee', 'password', 'Irfan', 'Durrani', 'durranee@hotmail.com');")
  conn.exec("INSERT INTO users (username, password, first_name, last_name, email) VALUES ('dodgyGuy', 'password', 'Dodgy', 'Guy', 'dodgy_guy@superdodge.com');")
  conn.exec("INSERT INTO users (username, password, first_name, last_name, email) VALUES ('NotVeryDodgyGuy', 'password', 'NotDodgy', 'Guy', 'notdodgy_guy@nododges.com');")
  conn.exec("INSERT INTO users (username, password, first_name, last_name, email) VALUES ('johndoe', 'johndoe', 'John', 'Doe', 'john@doe.com');")
  conn.exec("INSERT INTO users (username, password, first_name, last_name, email) VALUES ('rspec', 'rspec', 'RSpec', 'Rspec Surname', 'rspec@ruby.com');")
  p "users added to test database users table."


end
