require 'pg'
require 'rake'
# require 'sinatra/activerecord'
# require 'sinatra/activerecord/rake'

require_relative 'chitter'

desc 'Connect to database'
task :setup_database_connection do
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('chitter_test')
    puts '=== Connected to test database ==='
  else
    DatabaseConnection.setup('chitter')
    puts '=== Connected to development database ==='
  end
end

desc 'Clean test database'
task :clean_test_database do
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users, peeps RESTART IDENTITY;')
end

desc 'Setup databases'
task :setup do
  %w[chitter chitter_test].each do |database|
    connection = PG.connect
    connection.query("CREATE DATABASE #{database};")
  end
end

desc 'Setup development database'
task :setup_development_db do
  connection = PG.connect
  connection.query("CREATE DATABASE chitter;")
end

desc 'Migrate database tables'
task :migrate do
  Rake::Task['migrate_test'].execute
  Rake::Task['migrate_development'].execute
end

desc 'Migrate test database tables'
task :migrate_test do
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec(
    "CREATE TABLE users(
      id SERIAL PRIMARY KEY,
      name VARCHAR (60) NOT NULL,
      username VARCHAR (60) UNIQUE NOT NULL,
      email VARCHAR (255) UNIQUE NOT NULL,
      password VARCHAR (80) NOT NULL
    );"
  )

  connection.exec(
    "CREATE TABLE peeps(
      id SERIAL PRIMARY KEY,
      content VARCHAR (280) NOT NULL,
      user_id INTEGER REFERENCES users (id),
      time TIMESTAMP DEFAULT CURRENT_TIMESTAMP (0)
    );"
  )

  connection.exec(
    "ALTER TABLE peeps
      DROP CONSTRAINT peeps_user_id_fkey,
      ADD CONSTRAINT peeps_user_id_fkey
        FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE;"
  )
end

desc 'Migrate development database tables'
task :migrate_development do
  connection = PG.connect(dbname: 'chitter')

  connection.exec(
    "CREATE TABLE users(
      id SERIAL PRIMARY KEY,
      name VARCHAR (60) NOT NULL,
      username VARCHAR (60) UNIQUE NOT NULL,
      email VARCHAR (255) UNIQUE NOT NULL,
      password VARCHAR (80) NOT NULL
    );"
  )

  connection.exec(
    "CREATE TABLE peeps(
      id SERIAL PRIMARY KEY,
      content VARCHAR (280) NOT NULL,
      user_id INTEGER REFERENCES users (id),
      time TIMESTAMP DEFAULT CURRENT_TIMESTAMP (0)
    );"
  )

  connection.exec(
    "ALTER TABLE peeps
      DROP CONSTRAINT peeps_user_id_fkey,
      ADD CONSTRAINT peeps_user_id_fkey
        FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE;"
  )
end
