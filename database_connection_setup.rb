require "./lib/database_connection"

if ENV["ENVIRONMENT"] == "test"
  DatabaseConnection.setup("chitter_test")
elsif ENV["ENVIRONMENT"] == "production"
  DatabaseConnection.setup("chitter_production")
else
  DatabaseConnection.setup("chitter_development")
end
