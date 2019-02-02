require 'pg'
require './lib/database_connection'

def database_setup
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('chitter_database_test')
  else
    DatabaseConnection.setup('chitter_database')
  end
end 
