require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO chitters (message) VALUES ('this is a test message');")
  connection.exec("INSERT INTO chitters (message) VALUES ('this is another test message');")
end
