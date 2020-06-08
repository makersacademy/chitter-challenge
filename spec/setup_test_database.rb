require 'pg'

p "setting up test database..."

def truncate

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE chitter_accounts;")
  
end

