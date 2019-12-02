require 'pg'

def clear_table
  connection = PG.connect( dbname: 'Chitter_test' )
  result = connection.exec "TRUNCATE TABLE peeps;"
end
