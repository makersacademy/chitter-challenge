require 'pg'

def persisted_data(id:)
  con = PG.connect(dbname: 'chitter_test')
  con.query("SELECT * FROM peeps WHERE id = $1;", [id]
  )
end

def persisted_data_comments(id:)
  con = PG.connect(dbname: 'chitter_test')
  con.query("SELECT * FROM comments WHERE id = $1;", [id]
  )
end
