require 'pg'

def setup_test_database!
  con = PG.connect(dbname: 'chitter_test')
  con.exec("DROP TABLE users CASCADE;")
  con.exec("DROP TABLE peeps;")
  con.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(60), email VARCHAR(240), password VARCHAR(240), created_at timestamp with time zone DEFAULT now());")
  con.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(240), created_at timestamp with time zone DEFAULT now());
  ALTER TABLE peeps ADD COLUMN user_id INTEGER;  
  ALTER TABLE peeps ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id);")
end
