def setup_test_database
  require 'pg'

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE peeps, users;")
end  