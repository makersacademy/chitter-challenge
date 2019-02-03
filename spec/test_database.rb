require 'pg'

def test_database
  conn = PG.connect(dbname: 'peep_manager_test')
  # Clean the bookmarks table
  conn.exec("TRUNCATE comments, peeps, users;")
  # connection.exec("TRUNCATE bookmarks;")
end
