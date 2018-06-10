require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  # p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, \
                    email VARCHAR(60), password VARCHAR(140), \
                    name VARCHAR(60), username VARCHAR(60));")
    connection.exec("CREATE TABLE peeps \
                   (id SERIAL PRIMARY KEY, \
                    peep VARCHAR(140), username VARCHAR(60), \
                    created_at TIMESTAMP DEFAULT current_timestamp(0));")
  end
end

task :test_database_setup do

  # p "Cleaning database"

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the databases
  connection.exec("TRUNCATE users, peeps;")
  connection.exec("ALTER SEQUENCE users_id_seq RESTART;")
  connection.exec("ALTER SEQUENCE peeps_id_seq RESTART;")

end

task :teardown do
  p "Destroying databases...type 'y' to confirm that you want to destroy \
  the Chitter databases. This will remove all data in those databases!"

  # Get a confirmation from the user!
  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    # Drop each database in the list
    connection.exec("DROP DATABASE #{database}")
  end
end
