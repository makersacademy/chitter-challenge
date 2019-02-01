require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'Chitter_Manager_Test')
  result = connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
  result.first
end
