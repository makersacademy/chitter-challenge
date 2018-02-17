require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

databases = %w(chitter chitter_test)

task :setup do
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
  connection.exec "CREATE TABLE peeps(id SERIAL PRIMARY KEY, PEEP VARCHAR(240));"
rescue PG::DuplicateTable
  p "#{args[:database]} already has a table named peeps"
end
