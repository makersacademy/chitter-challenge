require 'pg'

def setup_test_database
  conn = PG.connect dbname: 'peeps_test'
  conn.exec ('TRUNCATE peeps')
end
