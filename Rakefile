require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_setup do
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE comments, users;")
end

task :setup do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    p 'Database is now set up!'
  end
end


task :setup_table do
  ['chitter', 'chitter_test'].each do |database|
connection = PG.connect(dbname: database)
connection.exec("CREATE TABLE IF NOT EXISTS users(id SERIAL PRIMARY KEY, username VARCHAR(60), email VARCHAR(60), password VARCHAR(140));")
connection.exec("CREATE TABLE IF NOT EXISTS comments(id SERIAL PRIMARY KEY, link_id INTEGER REFERENCES users (id),text VARCHAR(240) );")
p 'Users and comments tables now set up!'
end
end

task :drop_table do
  ['chitter', 'chitter_test'].each do |database|
connection = PG.connect(dbname: database)
connection.exec('DROP TABLE "comments";')
connection.exec('DROP TABLE "users";')
p 'Tables removed.'
end
end

task :reset_table do
  ['chitter', 'chitter_test'].each do |database|
connection = PG.connect(dbname: database)
connection.exec("TRUNCATE comments, users;")
p 'Data from tables removed.'
end
end
