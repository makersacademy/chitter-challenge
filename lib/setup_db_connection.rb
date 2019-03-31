require_relative 'db_manager'

if ENV["ENVIRONMENT"] == 'test'
  DBManager.setup('chitter_test')
else
  DBManager.setup('chitter')
end

p ENV
