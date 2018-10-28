require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, users; ")
  connection.exec("ALTER SEQUENCE users_id_seq RESTART WITH 1")

end
