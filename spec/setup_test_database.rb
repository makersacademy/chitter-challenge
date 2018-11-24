require 'pg'

def setup_test_database
  p "setting up the databse ready for testing..."
  connection = PG.connect(dbname: "chitter_test")
  connection.exec("TRUNCATE users;")
end
