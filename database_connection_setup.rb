require './lib/database_connection.rb'

def database_connection_setup
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('chitter_database_test')
  else
    DatabaseConnection.setup('chitter_database')
  end
end
