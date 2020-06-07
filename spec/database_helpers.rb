require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end
