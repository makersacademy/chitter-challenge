require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps")
  connection.exec("INSERT INTO peeps VALUES(1, 'My first peep', '#{Time.now}')")
  connection.exec("INSERT INTO peeps VALUES(2, '140 character limit', '#{Time.now}')")
end
