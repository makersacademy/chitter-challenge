require 'pg'

def persisted_data(id:, table:)
  conn = PG.connect(dbname: 'chitter_test')
  result = conn.query("SELECT * FROM #{table} WHERE id = #{id};")
end