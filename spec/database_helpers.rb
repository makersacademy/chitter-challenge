require 'pg'

def persisted_data(id:)
  con = PG.connect(dbname: 'chitter_test')
  result = con.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end
