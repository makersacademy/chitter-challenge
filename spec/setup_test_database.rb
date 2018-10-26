require 'pg'

def setup_test_database

  # p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")
# p connection.exec("SELECT * FROM peeps;")
end
