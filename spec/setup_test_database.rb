require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_peeps_test')

  connection.exec("TRUNCATE peeps;")
end

def setup_test_database_users
  connection = PG.connect(dbname: 'chitter_users_test')

  connection.exec("TRUNCATE users;")
end
