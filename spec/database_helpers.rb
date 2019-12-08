def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, makers;")
end

def persistent_data(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id='#{id}';")
end
