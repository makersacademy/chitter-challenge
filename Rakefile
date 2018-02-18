if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :set_up do
  p 'Creating database...'
  %w[chitter_challenge chitter_challenge_test].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database}")
    connection = PG.connect dbname: database
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(60), time VARCHAR(20));")
  end
end

task :test_database_setup do
  p 'Cleaning databases...'

  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('chitter_challenge_test')
    DatabaseConnection.query('TRUNCATE peeps;')
    DatabaseConnection.query("INSERT INTO peeps VALUES(1, 'This is a message!', '24/04/1989 11:02')")
    DatabaseConnection.query("INSERT INTO peeps VALUES(1, 'This is another message!', '24/04/1989 12:04')")
    DatabaseConnection.query("INSERT INTO peeps VALUES(1, 'Whatevs!', '24/04/1989 01:08')")
  end
end
