require 'pg'

def setup_test_database
  p "Setting up test database..."

  conn = PG.connect(dbname: 'chitter_challenge_test')

  conn.exec("TRUNCATE peeps;")
end
