require 'pg'

def setup_test_database
  p "Test db being set up..."

  connection = PG.connect(dbname: 'chitter_app_test')

  # Clear the peep_messages table
  connection.exec("TRUNCATE peep_messages;")
end