require 'pg'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_db_test')
else
  DatabaseConnection.setup('chitter_db')
end
