if ENV['ENVIRONMENT'] != 'production'
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
    connection.exec("CREATE TABLE peeps(text VARCHAR(60), time TIMESTAMP);")
  end
end

task :test_database_setup do
  p 'Cleaning databases...'

  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('chitter_challenge_test')
    DatabaseConnection.query('TRUNCATE peeps;')
    DatabaseConnection.query("INSERT INTO peeps VALUES('This is a message!', '24/04/1989 11:02')")
    DatabaseConnection.query("INSERT INTO peeps VALUES('This is another message!', '24/04/1989 12:04')")
    DatabaseConnection.query("INSERT INTO peeps VALUES('Whatevs!', '24/04/1989 01:08')")
  end
end

task :teardown do
  p "Destroying databases...type 'y' to confirm!"

  # Get a confirmation from the user!
  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['chitter_challenge', 'chitter_challenge_test'].each do |database|
    connection = PG.connect
    # Drop each database in the list
    connection.exec("DROP DATABASE #{database}")
  end
end
