require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps")
  connection.exec("INSERT INTO peeps (peep_text) VALUES('My first peep')")
  connection.exec("INSERT INTO peeps (peep_text) VALUES('140 character limit')")
end
