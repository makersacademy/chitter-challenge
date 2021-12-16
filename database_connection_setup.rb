require "./docs/database_connection"

if ENV["APP_ENV"] == "test"
  DatabaseConnection.setup("chitter_challenge_test")
else
  DatabaseConnection.setup("chitter_challenge")
end

