require 'pg'

p 'setting up database, clearing old data...'

def clean_peep_db
  con = PG.connect(dbname: 'chitter_test')
  con.exec("TRUNCATE TABLE peeps")
end

def clean_user_db
  con = PG.connect(dbname: 'chitter_test')
  con.exec("TRUNCATE TABLE users")
end
