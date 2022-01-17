require 'pg'

p "Test database is live..."

def setup_test_database
  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.exec("TRUNCATE chitter_posts;")
end