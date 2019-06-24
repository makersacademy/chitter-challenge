require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'Chitter_Test')
  connection.exec("TRUNCATE peep, members;")
end
