require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')

# Clear the tables for test
connection.exec("TRUNCATE messages, users;")