def persisted_data(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = $1;", [id])  
end