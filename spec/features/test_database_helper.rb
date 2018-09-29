require 'pg'

def clear_database
  con = PG.connect :dbname => 'peeps_manager_test' , :user => 'chloemingay'
  con.exec "TRUNCATE TABLE peeps"
end

def populate_database
  con = PG.connect :dbname => 'peeps_manager_test' , :user => 'chloemingay'
  con.exec "INSERT INTO peeps (peep, time) VALUES ('test1', CURRENT_TIMESTAMP)"
  con.exec "INSERT INTO peeps (peep, time) VALUES ('test1', CURRENT_TIMESTAMP)"
end
