def test_configure
  @connection = PG.connect(dbname: 'chitter_test')
  @connection.exec "TRUNCATE TABLE peeps;"
  @connection.exec "INSERT INTO peeps (peep, time) VALUES ('Hello there', 'NOW()')"
  @connection.exec "INSERT INTO peeps (peep, time) VALUES ('Another peep below', 'NOW()')"
  @connection.exec "INSERT INTO peeps (peep, time) VALUES ('This is a longer peep to see how it will be accepted in the test enviroment', 'NOW()')"
end
