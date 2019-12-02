require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter')
  connection.exec("TRUNCATE peeplist;")  
end
