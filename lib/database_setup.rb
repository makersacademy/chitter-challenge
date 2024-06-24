require_relative 'database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.connect("chitter_manager_test")
else
  DatabaseConnection.connect("chitter_manager")
end
