require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'chitter_app_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
  # connection.query("SELECT * FROM chitter WHERE id = $1;", [id])
end