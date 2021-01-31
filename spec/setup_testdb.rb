require 'pg'

def setup_testdb

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec('TRUNCATE chitter;')

end
