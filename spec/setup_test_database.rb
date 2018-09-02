def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def insert_test_urls_into_database
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("INSERT INTO peeps (peep)VALUES('hello world!');")
  connection.exec("INSERT INTO peeps (peep)VALUES('hello world!');")
  connection.exec("INSERT INTO peeps (peep)VALUES('whatsup peeps?!');")
  connection.exec("INSERT INTO peeps (peep)VALUES('#UNLOLLE');")
end