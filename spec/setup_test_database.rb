require 'pg'

def setup_test_database
  p "Setting up test database"

  connection = PG.connect(dbname: 'chitter_web_test')

  connection.exec("TRUNCATE peeps;")
end
