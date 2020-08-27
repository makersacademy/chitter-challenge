require 'pg'

def setup_test_database
  p "Setting up test database..."

  con = PG.connect :dbname => 'peeps_test'
  con.exec "TRUNCATE peeps;"
end
