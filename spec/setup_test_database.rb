require 'pg'

def setup_test_database!
  p "Clearing!"
  con = PG.connect(dbname: 'chitter_test')
  con.exec("TRUNCATE peeps;")
end