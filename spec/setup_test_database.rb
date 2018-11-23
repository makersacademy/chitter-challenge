require 'pg'

def setup_test_database
  DatabaseConnection.query("DROP TABLE users")
  DatabaseConnection.query("CREATE TABLE users (user_id SERIAL PRIMARY KEY, handle VARCHAR(15), email VARCHAR(128), password VARCHAR(128), display_name VARCHAR(50))")
  DatabaseConnection.query("DROP TABLE peeps")
  DatabaseConnection.query("CREATE TABLE peeps (peep_id SERIAL PRIMARY KEY, message VARCHAR(280), date TIMESTAMP, user_id INTEGER, reply_to INTEGER)")
end
