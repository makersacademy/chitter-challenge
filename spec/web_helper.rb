def fill_test_database
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.exec("INSERT INTO peeps (id, body) VALUES(1, 'I have eaten way too many brownies! Help!');")
end
