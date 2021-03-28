require 'pg'
require 'bcrypt'

p "Setting up test shouter database table with no entries..."

def connect_to_test_database
	 PG.connect(dbname: 'shouter_database_test')
end

def clean_test_database(connection)
	 connection.exec("DROP TABLE IF EXISTS shouts")
	 connection.exec("DROP TABLE IF EXISTS users")
end

def create_bookmarks_table_in_test(connection)
	connection.exec("CREATE TABLE users(user_id SERIAL PRIMARY KEY, name VARCHAR(100), username VARCHAR(100), email VARCHAR(100), password VARCHAR(100))")
	connection.exec("CREATE TABLE shouts(shout_id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users, time_shouted VARCHAR(60), shout_content VARCHAR(100));")
end

def populate_tables(connection)
  connection.exec("INSERT INTO users (name, username, email, password) VALUES('Han Solo', 'Solo', 'han@mfalcon.com', '$2a$12$DXl8ehH9k2brLxQJruQ0.uUThLIWtKUZoOg1YgYCa9enzNkr3fa8W');")
end

def setup_test_database
  connection = connect_to_test_database
  clean_test_database(connection)
  create_bookmarks_table_in_test(connection)
 	populate_tables(connection)
end
