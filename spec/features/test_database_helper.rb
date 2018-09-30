require 'pg'

def clear_database
  con = PG.connect :dbname => 'peeps_manager_test' , :user => 'chloemingay'
  con.exec "TRUNCATE TABLE peeps"
end

def populate_database
  con = PG.connect :dbname => 'peeps_manager_test' , :user => 'chloemingay'
  con.exec "INSERT INTO peeps (peep) VALUES ('test1')"
  con.exec "INSERT INTO peeps (peep) VALUES ('test2')"
end
