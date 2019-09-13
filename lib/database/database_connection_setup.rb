require './lib/database/database_connection'

p "-------- in here ---------"
p ENV['ENVIRONMENT']
if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test')
else
  DatabaseConnection.setup('bookmark_manager')
end
