require_relative './database_connection'

if ENV['ENVIRONMENT'] == 'test'
  Database.setup('peep_manager_test')
else
  Database.setup('peep_manager')
end
