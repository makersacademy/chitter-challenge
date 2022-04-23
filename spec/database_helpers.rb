require_relative '../lib/database_connection'

def persisted_data(table:, id:)
  DatabaseConnection.query(
    sql:
      "SELECT * FROM #{table} WHERE id = $1;",
    params:
      [id]
  )
end
