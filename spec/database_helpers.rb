require 'pg'
require_relative '../lib/database_connection'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
