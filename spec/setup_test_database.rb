require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_app_test')

# Clear the chitter table
connection.exec("TRUNCATE chitter;")
