require_relative 'lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  connection = DatabaseConnection.setup('chitter_test')
else
  connection = DatabaseConnection.setup('chitter')
end
