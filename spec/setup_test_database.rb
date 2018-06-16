require 'pg'

# p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_manager_test')

# Clear the peeps table
connection.exec("TRUNCATE peeps;")
connection.exec("TRUNCATE users;")
connection.close
