require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: "chitter_test")
 
  #  Clear table 
  # connection.exec("TRUNCATE peeps CASCADE;")
  connection.exec("TRUNCATE peeps;")
end

def insert_test_data
  
end
