require 'pg'

def test_database
  connection = PG.connect(dbname: 'peep_manager_test')

  # Clean the bookmarks table
  connection.exec("TRUNCATE peeps;")
  # connection.exec("TRUNCATE bookmarks;")
end
