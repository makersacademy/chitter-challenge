require 'pg'
require_relative '../lib/database_connection'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM peeps WHERE id = '#{id}';")
end

def persisted_data(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = $1;", [id])
end
