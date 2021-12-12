def setup_test_database
  require 'pg'

  p "Setting up test database..."

  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query('TRUNCATE messages, users CASCADE;')
  DatabaseConnection.query("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
end
