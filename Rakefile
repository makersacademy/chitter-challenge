if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

require 'pg'
require './app'

task :reset do
  p "Deleting databases..."

  ['peeps', 'peeps_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database};")
  end
end

task :setup do
  p "Creating databases..."

  ['peeps', 'peeps_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE messages(id SERIAL PRIMARY KEY, text VARCHAR(280), created TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP);")
  end
end
