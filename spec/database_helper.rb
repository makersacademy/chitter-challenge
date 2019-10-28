require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test_database')
  result = connection.query("SELECT * FROM chitter WHERE id = #{id};")
  result.first
end
