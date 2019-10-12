require 'pg'

def setup_test_database
  p "Setting up test database"

  connection = PG.connect(dbname: 'posts_test')
  connection.exec("TRUNCATE posts CASCADE")
end
