require_relative '../lib/database_connection'

def setup_test_database
  DatabaseConnection.query('TRUNCATE users CASCADE;')
  rs = DatabaseConnection.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';")
  rs.each { |db|
    DatabaseConnection.query("ALTER SEQUENCE #{db['table_name']}_id_seq RESTART WITH 1;")
  }
  User.create('admin@chitter.com', 'password1234')
end
