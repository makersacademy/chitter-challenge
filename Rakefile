require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

databases = %w(chitter chitter_test)

task :setup do
  p "Setting up databases..."
  databases.each do |database|
    Rake::Task[:create_database].invoke(database)
    Rake::Task[:create_database].reenable
    Rake::Task[:create_table].invoke(database)
    Rake::Task[:create_table].reenable
  end
end

task :create_database, [:database] do |t, args|
  connection = PG.connect
  connection.exec "CREATE DATABASE #{args[:database]}"
rescue PG::DuplicateDatabase
  p "#{args[:database]} already exists"
end

task :create_table, [:database] do |t, args|
  connection = PG.connect dbname: args[:database]
  connection.exec "CREATE TABLE peeps(id SERIAL PRIMARY KEY, body VARCHAR(240), created_date TIMESTAMP);"
rescue PG::DuplicateTable
  p "#{args[:database]} already has a table named peeps"
end

task :populate_test_database do
  connection = PG.connect dbname: databases[1]
  connection.exec "TRUNCATE TABLE peeps"
  connection.exec "INSERT INTO peeps(body, created_date) VALUES('This is a test peep', NOW())"
end

task :teardown do
  databases.each do |database|
    p "Hit 'y' to destroy #{database}"
    if STDIN.gets.chomp == 'y'
      connection = PG.connect
      connection.exec "DROP DATABASE #{database}"
      p "#{database} destroyed"
    end
  end
end
