require 'pg'

def persisted_data(id:)
  conn = PG.connect(dbname: 'chitter_test')
  result = conn.query("SELECT * FROM chirps WHERE id = #{id};")
  result.first
end
