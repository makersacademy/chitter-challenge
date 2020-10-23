require 'pg'

def setup_test_db
  p "Setting up test database..."

  #Change dbname: VALUE to your test db name
  connection = PG.connect(dbname: 'chitter_test')

  # Clear the table -> CHANGE NOTES WITH THE RELEVANT TABLE NAME
  connection.exec("TRUNCATE posts, users;")
end