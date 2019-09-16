require 'pg'

def set_up_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'honker_test')

  connection.exec("TRUNCATE honks;")
end 
