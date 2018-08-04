require 'pg'

def setup!
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
  connection.exec("TRUNCATE user_info;")
end
