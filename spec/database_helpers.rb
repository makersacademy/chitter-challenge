require 'pg'

def persisted_data(:id)
  con = PG.connect(dbname: 'chitter_test')
  result = con.query("SELECT * FROM chitter WHERE id = $1;", [id])
  result.first
end