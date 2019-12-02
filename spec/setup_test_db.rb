require 'pg'

def setup_db
  connection = PG.connect :dbname => 'chitter_test', :user => 'student'

  connection.exec "TRUNCATE peeps;"
end
