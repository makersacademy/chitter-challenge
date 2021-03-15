require 'pg'

def truncate_db
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE TABLE chitter, peeps;')
end
