require "./lib/database_connection"

def select_database
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup("chitter_test")
  else
    DatabaseConnection.setup("chitter")
  end
end
