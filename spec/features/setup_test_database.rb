require 'pg'

def clear_database
  con = PG.connect(dbname: 'chitter_test')
  con.exec ("TRUNCATE peeps;")
end
