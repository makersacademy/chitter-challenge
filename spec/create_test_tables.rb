require './lib/database_connection'

def create_test_tables
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('chitter_db_test')
  end
    DatabaseConnection.query("CREATE TABLE IF NOT EXISTS peeps (id SERIAL PRIMARY KEY, user_id varchar, body varchar(260), timestamp timestamp default CURRENT_TIMESTAMP);")
    DatabaseConnection.query("CREATE TABLE IF NOT EXISTS users (id SERIAL PRIMARY KEY, name varchar(60), email varchar(60), username varchar(60), password varchar);")
end