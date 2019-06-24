require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: "Chitter_Test")
else
  DatabaseConnection.setup(dbname: "Chitter")
end
