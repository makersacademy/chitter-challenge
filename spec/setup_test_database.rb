require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'chitter_db_test')

  connection.exec("TRUNCATE makers, peeps;")
end
