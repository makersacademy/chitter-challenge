require_relative 'lib/database_connection.rb'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup(dbname: "chitter_test")
else
  DatabaseConnection.setup(dbname: "chitter")
end