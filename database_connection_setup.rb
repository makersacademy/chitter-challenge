require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE TABLE peep_log;")
  DatabaseConnection.query("TRUNCATE TABLE users;")
else
  DatabaseConnection.setup('chitter')
end
