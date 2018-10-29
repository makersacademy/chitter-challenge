require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_setup do
  connection = PG.connect(dbname: 'peep_manager_test')
  connection.exec('TRUNCATE peeps;')
end

task :setup do
  ['peep_manager', 'peep_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(100), time VARCHAR(50));")
  end
end
