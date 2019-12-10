require 'pg'

p "Setup of test database"

def test_database_setup
  table = PG.connect(dbname: 'chitter_test_database')
  table.exec("TRUNCATE peeps, users;")
end
