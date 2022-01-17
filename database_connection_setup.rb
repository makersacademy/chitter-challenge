require "./docs/database_connection"

if ENV['ENVIRONMENT'] == "test"
  DatabaseConnection.setup("chitter_challenge_test")
else
  DatabaseConnection.setup("chitter_challenge")
end

