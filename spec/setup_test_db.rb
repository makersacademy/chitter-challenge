require 'pg'

def setup_test_db
  con = PG.connect(dbname: 'chitter_test')
  con.exec("DROP TABLE peeps;")
  con.exec("DROP TABLE users;")
  
  con.exec("CREATE TABLE users(user_id SERIAL PRIMARY KEY, email varchar(60), username varchar(60), full_name varchar(100), password varchar(60));")
  con.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, user_id int REFERENCES users(user_id), content varchar(140), date_posted date, time_posted time);")
end
