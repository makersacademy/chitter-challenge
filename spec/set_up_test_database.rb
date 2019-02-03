require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')

# Clear the bookmarks table
connection.exec("TRUNCATE chitter_messages;")
connection.exec("ALTER TABLE users DISABLE TRIGGER ALL;")
connection.exec("TRUNCATE users CASCADE;") # Truncates table with foreign key constraint.
connection.exec("ALTER TABLE users ENABLE TRIGGER ALL;")
