def database(table:, id:)
  DBConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
