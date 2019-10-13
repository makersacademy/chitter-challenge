require 'pg'

def setup_test_database
  conn = PG.connect(dbname: 'chitter_test')

  # Clear the bookmarks table
  conn.exec('TRUNCATE TABLE peeps;')

end