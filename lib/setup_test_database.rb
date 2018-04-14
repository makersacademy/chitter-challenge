require 'pg'

def clearout
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peep;")
end
