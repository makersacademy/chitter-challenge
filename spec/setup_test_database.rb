require 'pg'

p "Setting up test DB..."

def setup_test_database
  con = PG.connect(dbname: 'chitter_test')
  con.exec('TRUNCATE peeps')
end
