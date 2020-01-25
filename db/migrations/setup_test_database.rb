require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE TABLE bookmarks RESTART IDENTITY;")
  connection.exec("TRUNCATE TABLE comments RESTART IDENTITY;")
end
