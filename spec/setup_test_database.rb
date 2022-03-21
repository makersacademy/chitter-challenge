require 'pg'

p "Setting up"

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE chitter_posts, users")
end
