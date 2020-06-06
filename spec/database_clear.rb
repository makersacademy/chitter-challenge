require 'pg'

p 'setting up database, clearing old data...'

def clean_test_db
  con = PG.connect(dbname: 'chitter_test')
  con.exec("TRUNCATE TABLE peeps")
end