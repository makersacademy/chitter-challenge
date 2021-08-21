require 'pg'

def setup_chitter_test_database
  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.exec("TRUNCATE peeps;")
end

def setup_user_test_database
  connection = PG.connect(dbname: 'user_manager_test')
  connection.exec("TRUNCATE users;")
end