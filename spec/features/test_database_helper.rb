require 'pg'

def clear_database
  con = PG.connect :dbname => 'peeps_manager_test' , :user => 'chloemingay'
  con.exec "TRUNCATE TABLE users CASCADE"
end

# def create_test_user
#   con = PG.connect :dbname => 'peeps_manager_test' , :user => 'chloemingay'
#   con.exec "INSERT INTO users (email, ) VALUES ('test1')"

def populate_database
  con = PG.connect :dbname => 'peeps_manager_test' , :user => 'chloemingay'
  con.exec "INSERT INTO users (username) VALUES ('username1')"
  con.exec "INSERT INTO peeps (peep, userid) VALUES ('test1', (SELECT userid from users WHERE username='username1'))"
  con.exec "INSERT INTO peeps (peep, userid) VALUES ('test2', (SELECT userid from users WHERE username='username1'))"
end
