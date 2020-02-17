def setup_test_database
  require 'pg'

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE users, peeps;")
  # connection.exec("INSERT INTO users (user_name) VALUES('Testname')")
end 
