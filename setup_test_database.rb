require 'pg'

# p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_app_test')

# Clear the bookmarks table
connection.exec("TRUNCATE peeps;")
connection.exec("TRUNCATE users")
connection.close
