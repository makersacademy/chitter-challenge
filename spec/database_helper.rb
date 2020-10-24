require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM chitter_peeps WHERE id = #{id};")
  result.first
end 