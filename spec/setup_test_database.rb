require 'pg'

def setup_test_database
  con = PG.connect :dbname => 'twitter_clone_test'
  con.exec 'TRUNCATE TABLE tweets RESTART IDENTITY'
end