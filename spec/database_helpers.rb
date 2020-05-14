require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'Chitter_Manager_test')
  connection.query("SELECT * FROM #{table} WHERE id = #{id};")
end
