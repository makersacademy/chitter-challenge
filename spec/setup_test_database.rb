require 'pg'

def clearout
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE users, posts;")
  connection.exec("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
  connection.exec("ALTER SEQUENCE posts_id_seq RESTART WITH 1;")
end
