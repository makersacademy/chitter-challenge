require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  #Clear the table after use
  connection.exec("TRUNCATE TABLE peeps RESTART IDENTITY;")
end