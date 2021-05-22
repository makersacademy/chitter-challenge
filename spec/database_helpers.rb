require 'pg'
require './lib/database_connection'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
  result.first
end