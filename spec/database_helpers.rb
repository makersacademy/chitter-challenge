require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_messenger_test')
  result = connection.query("SELECT * FROM messages WHERE id = #{id};")
  result.first
end