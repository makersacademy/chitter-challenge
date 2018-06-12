require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  # p "Creating databases..."

  connection = PG.connect
  connection.exec("CREATE DATABASE chitter;")
  connection.exec("CREATE DATABASE chitter_test;")

  connection = PG.connect(dbname: 'chitter')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(60), time_posted TIME);")

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(60), time_posted TIME);")
end

task :setup_test_database do

	# p 'Resetting test database...'
	 connection = PG.connect(dbname: 'chitter_test')
	 connection.exec("TRUNCATE peeps")

end
