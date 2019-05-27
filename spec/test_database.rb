require 'pg'

def test_database!
  
  con = PG.connect(dbname: 'chitter_test')
  con.exec("TRUNCATE peeps RESTART IDENTITY;")
  
end
