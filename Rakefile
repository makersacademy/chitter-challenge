# if ENV['RACK_ENV'] != 'production'
#   require 'rspec/core/rake_task'
#
#   RSpec::Core::RakeTask.new :spec
#
#   task default: [:spec]
# end
require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec('TRUNCATE peeps;')

  connection.exec("INSERT INTO peeps VALUES('This is my first peep', '11.35', 'leon_linton');")
  connection.exec("INSERT INTO peeps VALUES('This is my second peep', '17.55', 'beth_jones');")
  connection.exec("INSERT INTO peeps VALUES('This is my third peep', '08.21', 'max_wild');")
end

task :setup do
  p "Creating databases..."
  ['chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(peep VARCHAR, time VARCHAR, username VARCHAR);")
  end
end
