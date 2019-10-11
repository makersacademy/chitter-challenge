require 'pg'

p "Setting up test database..."

def setup_test_database


  connection = PG.connect(dbname: 'Twitter_clone_test')
  connection2 = PG.connect(dbname: 'Account_test')

# Clear the bookmarks table
  connection.exec("TRUNCATE chitter;")
  connection2.exec("TRUNCATE accounts;")


end
