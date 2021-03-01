require 'pg'

def setup_test_database
p "Setting up test database..."

connection = PG.connect(dbname: 'peeps_test')

# Clear the bookmarks table
connection.exec("TRUNCATE peeps;")
end
