require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'Chitter_test')

  connection.exec("TRUNCATE chitter_feed;")
end
