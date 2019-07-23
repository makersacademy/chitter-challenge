require 'pg'

p "Setting up test chitter..."

def setup_test_chitter
connection = PG.connect(dbname: 'chitter_test')

# Clear the bookmarks table
connection.exec("TRUNCATE accounts, messages;")

end
