require "./lib/database_connection"

if ENV["ENVIRONMENT"] == "test"
  DatabaseConnection.setup(dbname: "chitter_test")
elsif ENV["ENVIRONMENT"] == "production"
  DatabaseConnection.setup(host: "<%= ENV['CHITTER_DB_HOST'] %>", port: "<%= ENV['CHITTER_DB_PORT'] %>", dbname: "<%= ENV['CHITTER_DB_NAME'] %>", user: "<%= ENV['CHITTER_DB_USERNAME'] %>", password: "<%= ENV['CHITTER_DB_PASSWORD'] %>")
else
  DatabaseConnection.setup(dbname: "chitter_development")
end
