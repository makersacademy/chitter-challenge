require 'pg'

def clear_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')
  # Clear the peeps_data table
  connection.exec("TRUNCATE peeps_data")
end