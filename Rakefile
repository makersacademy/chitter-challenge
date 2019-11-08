if ENV["RACK_ENV"] != "production"
  require "rspec/core/rake_task"

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

# task :setup do
#   connection = PG.connect
#   connection.exec('CREATE DATABASE country_data;')

#   connection = PG.connect :dbname => 'country_data';
#   connection.exec('CREATE TABLE countries (id SERIAL PRIMARY KEY, name VARCHAR(20), continent VARCHAR(20), population INT, density INT, gni INT);')
# end

# task :teardown do
#   # Destroy development and test databases
# end

# task :seed do
#   # Add some dummy data to the development database
# end
