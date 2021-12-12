require 'pg'

def test_database_setup
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, users;")
end