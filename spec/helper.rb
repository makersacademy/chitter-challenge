require 'pg'

def truncate_test_db
  connection = PG.connect(dbname: 'chitter_challenge_test')
  connection.exec('TRUNCATE TABLE peeps, users')
end
