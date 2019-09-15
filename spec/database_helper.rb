def trunc_test_database
  con = PG.connect dbname: 'chitter_test'
  con.exec 'TRUNCATE peeps, chitter_users'
end

def populate_test_database
  con = PG.connect dbname: 'chitter_test'
  con.exec "INSERT INTO peeps (content) VALUES('This is chitter')"
  con.exec "INSERT INTO peeps (content) VALUES('This peep should appear first')"
end

def drop_test_database
  con = PG.connect dbname: 'chitter_test'
  con.exec 'DROP TABLE peeps, chitter_users CASCADE'
  con.exec "CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content VARCHAR(280),
  timestamp timestamp DEFAULT to_timestamp(to_char(current_timestamp, 'YYYY-MM-DD HH24:MI'), 'YYYY-MM-DD HH24:MI'))"
  con.exec 'CREATE TABLE chitter_users (id SERIAL PRIMARY KEY, email VARCHAR(60) UNIQUE, username VARCHAR(60) UNIQUE, name VARCHAR(60), password VARCHAR(60));'
end
