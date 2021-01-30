require 'pg'

def setup_test_database
p "setting up test database..."

connection = PG.connect(dbname: 'peeps_test')

# Clear the bookmarks table
connection.exec("TRUNCATE bookmarks;")
end
