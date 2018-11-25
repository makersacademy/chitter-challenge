require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end

def persist_user_data(name:, username:, email:, password:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email;")
  result.first
end
