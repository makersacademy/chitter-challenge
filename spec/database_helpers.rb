require 'pg'
require 'peeps'

def persisted_data(id)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.exec("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end
