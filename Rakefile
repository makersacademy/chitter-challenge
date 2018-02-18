require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id VARCHAR(60), peep VARCHAR(60), time VARCHAR(60));")
  end
end

task :test_database_setup do
  p "Cleaning database..."

  if ENV['ENVIRONMENT'] == 'test'

    DatabaseConnection.setup("chitter_test")
    DatabaseConnection.query("TRUNCATE peeps")
    DatabaseConnection.query("INSERT INTO peeps VALUES('@Joshua_Holloway1337', 'Hi Chitter World!', '2008-12-13 12:43:00')")
    DatabaseConnection.query("INSERT INTO peeps VALUES('@Betty_food_lover', 'I really hate how ASDA stores its fruit', '2012-08-15 17:20:55')")
    DatabaseConnection.query("INSERT INTO peeps VALUES('@Dexter_does_science', 'Did you know that human livers can regrow?', '2018-01-01 04:37:22')")
  end
end

