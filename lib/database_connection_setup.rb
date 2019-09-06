require_relative 'database_connection'

def database_connection_setup
  if ENV['RACK_ENV'] == 'test'
    DatabaseConnection.setup('chitter_test')
  else
    DatabaseConnection.setup('chitter')
  end
end
