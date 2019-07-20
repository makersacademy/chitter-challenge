require_relative './database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_peeps_test')
else
  DatabaseConnection.setup('chitter_peeps')
end
