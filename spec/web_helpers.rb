require 'pg'

def add_test_peeps
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("INSERT INTO peeps (peep) VALUES ('First peep'), ('Second peep');")
end

def clear_test_db
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE peeps")
end
