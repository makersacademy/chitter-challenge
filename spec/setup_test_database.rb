require 'pg'
def setup_test_database
  con = PG.connect :dbname => 'peeps_test'

  con.exec "TRUNCATE peeps, users RESTART IDENTITY;"
  
end