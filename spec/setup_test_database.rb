def setup_test_database
  require 'pg'

  p "Setting up test database..."

  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query('TRUNCATE messages, users CASCADE;')
end
