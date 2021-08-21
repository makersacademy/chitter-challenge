require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  
  # clean the cheets table
  connection.exec("TRUNCATE TABLE
                          peeps,
                          comments,
                          users")

end