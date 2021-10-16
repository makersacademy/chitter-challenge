require "./lib/database_connection.rb"

if ENV["ENVIRONMENT"] == "test"
  DatabaseConnection.connect("chitter_test")
else 
  DatabaseConnection.connect("chitter")
end

