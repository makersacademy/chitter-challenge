require 'pg'

def setup_test_database
  p "setting up the databse ready for testing..."
  # connect to the test db
  connection = PG.connect(dbname: "chitter_test")
  # clear the table
  connection.exec("TRUNCATE users, peeps;")
end
