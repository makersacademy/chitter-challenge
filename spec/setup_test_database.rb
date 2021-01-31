require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')

# clears the bookmarks table
connection.exec("TRUNCATE peeps;")
connection.exec("TRUNCATE users;")
