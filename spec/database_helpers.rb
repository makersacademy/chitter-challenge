require 'pg'

def query_data(id)
  PG.connect(dbname: 'chitter_test').query("SELECT * FROM messages WHERE id = #{id};").first
end