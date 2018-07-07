require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  p 'Creating databases...'
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), password VARCHAR(60), email VARCHAR(100));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id) ON DELETE CASCADE, content VARCHAR(240), time VARCHAR(60));")
  end
end

task :test_database_setup do
  p 'Resetting database...'
  connection = PG.connect(dbname: 'chitter_test')
  # clear the users and peeps tables:
  connection.exec("TRUNCATE users, peeps;")
  # add some test data:
  User.create('Han Solo', 'hansolo', 'hansolo@gmail.com', 'pa$$w0rd1')
  User.create('Luke Skywalker', 'lukeskywalker', 'lukeskywalker@gmail.com', 'pa$$w0rd2')
  User.create('Princess Leia', 'princessleia', 'princessleia@gmail.com', 'pa$$w0rd3')
end

task :teardown do
  p "Deleting databases...type 'y' to confirm that you want to destroy the Chitter databases. This will remove all data in those databases!"
  confirm = STDIN.gets.chomp
  return unless confirm == 'y'
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database};")
  end
end

task :empty do
  p "Emptying database tables...type 'y' to confirm that you want to empty your tables!"
  confirm = STDIN.gets.chomp
  return unless confirm == 'y'
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect(dbname: database)
    connection.exec("TRUNCATE users, peeps;")
  end
end
