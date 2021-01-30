require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_manager_test')

connection.exec('Truncate bookmarks;")