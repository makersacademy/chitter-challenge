require './lib/database_connection'

if ENV['ENVIRONMENT'] != 'test'
  DatabaseConnection.setup('chitter')
end
