def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def insert_test_urls_into_database
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("INSERT INTO peeps VALUES(1, 'hello world!');")
  connection.exec("INSERT INTO peeps VALUES(2, 'whatsup peeps?!');")
  connection.exec("INSERT INTO peeps VALUES(3, '#UNLOLLE');")
end