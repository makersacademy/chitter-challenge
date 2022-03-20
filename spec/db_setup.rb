require 'pg'

def truncate_db
  PG.connect(dbname: 'chitter_test').exec('TRUNCATE chitters;')
end
