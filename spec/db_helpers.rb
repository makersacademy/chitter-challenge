require 'pg'

def truncate_database 
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE TABLE chitters;")
end

def add_test_chitters
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO chitters (title) VALUES('Hello!)
end