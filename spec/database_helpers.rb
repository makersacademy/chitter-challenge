require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_manager_test')
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};").first
  result
end

def user_persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_manager_test')
  result = connection.query("SELECT * FROM users WHERE id = #{id};").first
  result
end