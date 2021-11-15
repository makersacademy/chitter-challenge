require 'pg'

def setup_test_database
  p "Setting up a Chitter test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end
