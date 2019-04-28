require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'peeps_test')

# Clear the bookmarks table
  connection.exec("TRUNCATE peeps;")
end
