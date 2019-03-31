require 'pg'

def test_db_setup
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("DROP TABLE posts")
  conn.exec("CREATE TABLE posts(id SERIAL PRIMARY KEY, post VARCHAR(280));")
end
