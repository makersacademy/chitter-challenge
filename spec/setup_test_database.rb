require 'pg'
def set_up_test_database
  connection = PG.connect(dbname: 'chitter_test')
  
  connection.exec("TRUNCATE peeps;")
end