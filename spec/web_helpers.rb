require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: "chitter_test")
 
  #  Clear table 
  # connection.exec("TRUNCATE peeps CASCADE;")
  connection.exec("TRUNCATE peeps;")
end

def insert_test_data
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("INSERT INTO peeps (content, time) VALUES ('123',NOW());")
  connection.exec("INSERT INTO peeps (content, time) VALUES ('456',NOW());")
  connection.exec("INSERT INTO peeps (content, time) VALUES ('789',NOW());")
end
