require 'pg'

def setup_test_database
  connection_01 = PG.connect dbname: 'chitter_app_test'
  connection_02 = PG.connect dbname: 'chitter_user_test'
  # Clear the bookmarks table
  connection_01.exec("TRUNCATE peeps;")
  # connection_02.exec("TRUNCATE users;")
end