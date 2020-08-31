require 'pg'
def setup_test_database
  con = PG.connect :dbname => 'peeps_test'

  con.exec "TRUNCATE peeps RESTART IDENTITY;"
  con.exec "TRUNCATE users RESTART IDENTITY;"
end