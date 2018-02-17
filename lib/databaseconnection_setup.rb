p "Setting up database to connect"

require "pg"
require "./lib/database_connection"

if ENV['ENVIRONMENT'] == "test"
  DatabaseConnection.setup("chitter_test")
else
  DatabaseConnection.setup("chitter")
end
