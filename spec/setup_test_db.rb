require 'pg'

def setup_db
  connection = PG.connect :dbname => 'chitter_test', :user => 'student'
  connection = PG.connect( dbname: 'chitter_test' )
  connection.exec "TRUNCATE peeps;"
end