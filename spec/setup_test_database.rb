require 'pg'

p "Setting up test database..."

def truncate
  connection = PG.connect(dbname: 'chitter_challenge_test')
  connection.exec("TRUNCATE peeps;")
end
