def trunc_test_database
  con = PG.connect dbname: 'chitter_test'
  con.exec 'TRUNCATE peep, users'
end

def populate_test_database
  con = PG.connect dbname: 'chitter_test'
  con.exec "INSERT INTO users (name, email) values ('Volker', 'volker@volker.com')"
  con.exec "INSERT INTO users (name, email) values ('Volker2', 'volker2@volker2.com')"
  con.exec "INSERT INTO users (name, email) values ('Volker3', 'volker3@volker3.com')"
  con.exec "INSERT INTO peep (content, submission_time, user_id) values ('Test1', CURRENT_TIMESTAMP, 1)"
  con.exec "INSERT INTO peep (content, submission_time, user_id) values ('Test2', CURRENT_TIMESTAMP, 2)"
  con.exec "INSERT INTO peep (content, submission_time, user_id) values ('Test3', CURRENT_TIMESTAMP, 3)"
  con.exec "INSERT INTO peep (content, submission_time, user_id) values ('Test4', CURRENT_TIMESTAMP, 2)"
end

def drop_test_database
  con = PG.connect dbname: 'chitter_test'
  con.exec 'DROP TABLE peep CASCADE'
  con.exec 'DROP TABLE users'
  con.exec 'CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60));'
  con.exec 'CREATE TABLE peep(peep_id SERIAL PRIMARY KEY, content VARCHAR(160), submission_time TIMESTAMP, user_id integer REFERENCES users (id));'
end
