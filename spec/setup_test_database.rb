require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_manager_test')

  # Clear the messages table
  connection.exec("TRUNCATE messages, registration;")
end
