require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_app_test')
  result = connection.query("SELECT * FROM peep_messages WHERE id = #{id};")
  result.first
end