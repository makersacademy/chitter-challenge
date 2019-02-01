require 'pg'

def populate_test_data
  connection = PG.connect(dbname: 'chitter_testing')
  connection.exec("INSERT INTO peeps(body) VALUES('Test peep');")
  connection.exec("INSERT INTO peeps(body) VALUES('Peeping about snow');")
  connection.exec("INSERT INTO peeps(body) VALUES('Peep 2');")
end
