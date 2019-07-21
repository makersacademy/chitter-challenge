require './lib/database_connection'

if ENV["ENVIRONMENT"] == "test"
  DatabaseConnection.setup("peeps_manager_test")
else
  DatabaseConnection.setup("peeps_manager")
end
