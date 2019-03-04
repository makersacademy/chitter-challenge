require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitterweb_test')
  result = connection.query("SELECT * FROM users WHERE id = #{id};")
  result.first
end
