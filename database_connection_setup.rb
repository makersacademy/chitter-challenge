require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  return DatabaseConnection.setup('chitter_test')
else
  return DatabaseConnection.setup('chitter')
end
