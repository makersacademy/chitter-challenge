require 'pg'

p "Setting up test database..."

def set_test_database
  connection = PG.connect(dbname: 'peep_manager_test')
  # Clear the peeps table
  connection.exec("TRUNCATE peeps, users;")
end

set_test_database