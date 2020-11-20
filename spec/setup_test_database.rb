require 'pg'

def setup_test_database
  p "setting up test databse..."

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE chitter CASCADE;")
end
