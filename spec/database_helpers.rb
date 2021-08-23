require '../lib/database_connection'

def persisted_data(table:, id:)
  DatabaseConnection.query(
    "SELECT * FROM $1 WHERE id = $2;",
    [table, id]
  )
end