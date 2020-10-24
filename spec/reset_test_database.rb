require 'pg'

def reset_test_database
  connection = PG.connect :dbname => 'chitter_manager_test'
  connection.exec("TRUNCATE peeps, users;")
end
