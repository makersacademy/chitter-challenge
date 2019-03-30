require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_app_test')

  # Clean the chitter table
  connection.exec("TRUNCATE chitter;")
end
