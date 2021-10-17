require "./lib/database_connection"

if ENV["ENVIRONMENT"] == "test"
  DatabaseConnection.connect("chitter_test")
else 
  DatabaseConnection.connect("chitter")
end
