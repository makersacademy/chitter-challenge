require 'database_connection'

def persisted_data(id:)
  conn = DatabaseConnection.setup('chitter_test')
  conn.query("SELECT * FROM users WHERE id = #{id};")
end
