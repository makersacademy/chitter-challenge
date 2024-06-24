require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

# Clear the chitter table
  connection.exec("TRUNCATE Username, Messages;")
  # connection.exec("TRUNCATE Messages;")

end
