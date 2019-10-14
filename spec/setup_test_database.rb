require 'pg'

def setup_test_database

  p "Setting up test database..."
  db = PG.connect(dbname: 'peeps_test')
  db.exec("TRUNCATE TABLE users, peeps;")
end
