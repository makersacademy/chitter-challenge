require 'pg'

def setup_testing_database

  connection = PG.connect(dbname: 'test_chitter_database')
  connection.exec("TRUNCATE peeps;")
  connection.exec("ALTER SEQUENCE peeps_id_seq RESTART WITH #{1};")

end
