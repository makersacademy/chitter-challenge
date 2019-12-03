require 'pg'

def clear_table
  connection = PG.connect( dbname: 'Chitter_test' )
  connection.exec "TRUNCATE TABLE peeps;"
  connection.exec "TRUNCATE TABLE users;"
end
