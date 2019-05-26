require 'pg'

def setup_test_database

  p "Setting up test database..............⏳"

  con = PG.connect(dbname: 'chitter_test')

# Clear the peeps table
  con.exec('TRUNCATE peeps;')

end
