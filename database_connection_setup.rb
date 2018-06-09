require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE TABLE peep_log;")
else
  DatabaseConnection.setup('chitter')
end
