# in spec/setup_test_database.rb

require 'pg'

def setup_test_database

  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_manager_test')

  # Clear the chitter table

  connection.exec("TRUNCATE chitter CASCADE;")
  connection.exec("TRUNCATE user_chitter CASCADE;")

end
