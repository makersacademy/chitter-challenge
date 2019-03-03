require 'pg'

def setup_test_db
  connection = PG.connect(dbname: 'chitter_test')

  # Clean the bookmarks table
  connection.exec("TRUNCATE peeps, users;")
end
