require 'pg'
def set_up_test_database
  conn = PG.connect(dbname: 'chitter_test')
  
  conn.exec("TRUNCATE peeps;")
end