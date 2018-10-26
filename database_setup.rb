require './lib/database_manager'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseManager.setup('chitter_test')
else
  DatabaseManager.setup('chitter')
end
