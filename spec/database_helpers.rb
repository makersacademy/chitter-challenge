def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE TABLE peeps;")
end

def persistent_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.exec("SELECT * FROM peeps WHERE id='#{id}';")
  result[0]
end
