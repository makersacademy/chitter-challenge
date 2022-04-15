require 'pg'

def truncate_database 
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE TABLE peeps;")
end
