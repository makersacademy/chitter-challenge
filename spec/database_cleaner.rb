require 'pg'

def database_cleaner
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE posts")
end
