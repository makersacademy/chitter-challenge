require 'pg'

def setup_test_database
p "Setting up test database..."

connection = PG.connect(dbname: 'chitter')

# Clear the bookmarks table
connection.exec("TRUNCATE chitter_feed;")
end