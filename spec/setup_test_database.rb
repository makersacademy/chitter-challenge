require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_app_test')
# Clean the chitter table
connection.exec("TRUNCATE chitter, users;")
