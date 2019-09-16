require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'honker_test')
  result = connection.query("SELECT * FROM honks WHERE id = #{id};")
end
