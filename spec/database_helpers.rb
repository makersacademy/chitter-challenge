require 'pg'

def persisted_data(table:, id:)
  con = PG.connect(dbname: 'chitter_test')
  result = con.query("SELECT * FROM $1 WHERE id = $2;", 
    [table, id]
  )
end