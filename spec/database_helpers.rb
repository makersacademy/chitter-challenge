require 'pg'

def persisted_peeps_data(id)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end

def persisted_user_data(username)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM users WHERE username = '#{username}';")
  result.first
end
