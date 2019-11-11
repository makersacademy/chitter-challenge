require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # clear the peeps TABLE
  connection.exec("TRUNCATE peeps;")

end
