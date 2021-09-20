require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_app_test')
  
  connection.exec("TRUNCATE chitter;")

end
