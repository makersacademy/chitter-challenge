require 'pg'

def database_data(id:, table:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end