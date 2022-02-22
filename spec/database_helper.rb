require 'pg'

def persisted_data(id)
  connection = DatabaseConnection.setup('chitter_test')
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end
