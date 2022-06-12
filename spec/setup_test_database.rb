require 'pg'

def setup_test_database
  p "Setting up test database..."

conn = PG.connect(dbname: 'chitter_test')

# Clear the bookmarks table
conn.exec("TRUNCATE peeps;")
end
