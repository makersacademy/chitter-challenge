# in spec/setup_test_database.rb

require 'pg'

p "Setting up test database..."

def setup_test_database
test_connection = PG.connect(dbname: 'chitter_test')

# Clear the bookmarks table
test_connection.exec("TRUNCATE messages")
# test_connection.exec("TRUNCATE people")
end
