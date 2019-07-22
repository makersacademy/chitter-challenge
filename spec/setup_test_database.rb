require 'pg'

def setup_test_database
p "Setting up test database..."

connection = PG.connect(dbname: 'cheet_base_test')

# Clear the bookmarks table
connection.exec("TRUNCATE chitter;")
end
