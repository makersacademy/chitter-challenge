require 'pg'

def test_database
  connection = PG.connect(dbname: 'chitter_challenge_test')
  connection.exec("TRUNCATE chitter, users;")
end
