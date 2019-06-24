require './lib/database_connection'

def create_test_tables
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('chitter_test')
  else
    DatabaseConnection.setup('chitter')
  end
end
