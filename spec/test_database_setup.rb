require 'pg'

p "Setup of test database"

def test_database_setup
  table = PG.connect(dbname: 'chitter_test_database')
  table.exec("TRUNCATE peeps;")
end

def clear_users_table
  table = PG.connect(dbname: 'chitter_test_database')
  table.exec("TRUNCATE users;")
end
