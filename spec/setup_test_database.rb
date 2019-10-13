require 'pg'

def setup_test_database
  conn = PG.connect(dbname: 'chitter_test')
  

  # Clear the peeps notable
  conn.exec('TRUNCATE peeps;')
end
