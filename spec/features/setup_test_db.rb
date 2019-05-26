require 'pg'

def setup_test_db
  p "Setting up test database..."
  con = PG.connect :dbname => 'chitter_test'
  con.exec "TRUNCATE TABLE chitter;"
end

