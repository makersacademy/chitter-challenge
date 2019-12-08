def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, makers;")
end

def persistent_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.exec("SELECT * FROM #{table} WHERE id='#{id}';")
  result[0]
end
