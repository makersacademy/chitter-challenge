require 'pg'

def test_database_setup
  connection = PG.connect(:dbname => 'chitter_test')
  connection.exec('TRUNCATE peeps, users')
  connection = PG.connect(:dbname => 'chitter_test')
  connection.exec("INSERT INTO peeps(peep,time) VALUES ('Hey, how it do?','19/01/2020 00:00');")
end 