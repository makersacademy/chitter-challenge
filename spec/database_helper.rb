require 'pg'

def test_database_setup
  connection = PG.connect(:dbname => 'chitter_test')
  connection.exec('TRUNCATE TABLE peeps')
  connection = PG.connect(:dbname => 'chitter_test')
  connection.exec("INSERT INTO peeps(peep) VALUES ('Hey, how it do?');")
end 