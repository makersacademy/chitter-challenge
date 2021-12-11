require 'pg'

p "Setting up test database..."
def setup_test_database
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE peeps;")
end