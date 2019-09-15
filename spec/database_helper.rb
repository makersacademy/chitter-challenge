def trunc_test_database
  con = PG.connect dbname: 'chitter_test'
  con.exec 'TRUNCATE peeps'
end

def populate_test_database
  con = PG.connect dbname: 'chitter_test'
  con.exec "INSERT INTO peeps (content) VALUES('This is chitter')"
  con.exec "INSERT INTO peeps (content) VALUES('This peep should appear first')"
end

def drop_test_database
  con = PG.connect dbname: 'chitter_test'
  con.exec 'DROP TABLE peeps CASCADE'
  con.exec 'CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(280),
  timestamp timestamp DEFAULT CURRENT_TIMESTAMP);'
end
