require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'squiggler_test')
  connection.exec("TRUNCATE users, squiggles, nuttags, squiggles_tags;")
end

task :setup do
  p "Creating databases..."

  ['squiggler', 'squiggler_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")

    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(240));")
    connection.exec("CREATE TABLE squiggles(id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users (id), squiggle VARCHAR(60), time TIMESTAMP);")
    connection.exec("CREATE TABLE nuttags(id SERIAL PRIMARY KEY, tag VARCHAR(60));")
    connection.exec("CREATE TABLE squiggles_tags(id SERIAL PRIMARY KEY, squiggle_id INTEGER REFERENCES squiggles (id) ON DELETE CASCADE, nuttag_id INTEGER REFERENCES nuttags (id));")
  end
end

task :teardown do
  p "Destroying databases...type 'y' to confirm that you want to destroy the Squiggler databases. This will remove all data in those databases!"

  confirm = STDIN.gets.chomp

  return unless confirm == 'y'

  ['squiggler', 'squiggler_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database }")
  end
end
