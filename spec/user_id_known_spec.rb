
require 'pg'

def insert_user_known_id
  p "Setting up dummy user..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear test table
  connection.exec("INSERT INTO chitter VALUES(999, 'Testerson');")
end
