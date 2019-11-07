require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  connect.exec("TRUNCATE peeps")
end
