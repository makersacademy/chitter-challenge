require "./lib/db_connection"

if ENV["ENVIRONMENT"] == "test"
  DBConnection.setup("chitter")
else
  DBConnection.setup("chitter_test")
end
