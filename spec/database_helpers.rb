require 'pg'

def persisted_data(id:, table:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end