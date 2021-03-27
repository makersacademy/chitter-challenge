require 'pg'

def persisted_data_peeps(id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end

def persisted_data_users(id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM users WHERE id = #{id};")
  result.first
end
