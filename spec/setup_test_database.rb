require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_peeps_test')

  # Clean the bookmarks table
  connection.exec("TRUNCATE peeps;")
end
