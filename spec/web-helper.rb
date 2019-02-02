def test_configure
  @connection = PG.connect(dbname: 'chitter_test')
  @connection.exec "TRUNCATE TABLE peeps;"
  @connection.exec "INSERT INTO peeps (peep, time, username) VALUES ('Hello there', 'NOW()', 'Debora')"
  @connection.exec "INSERT INTO peeps (peep, time, username) VALUES ('Another peep below', 'NOW()', 'Paul')"
  @connection.exec "INSERT INTO peeps (peep, time, username) VALUES ('This is a longer peep to see how it will be accepted in the test enviroment', 'NOW()', 'Simon')"
  @connection.exec "TRUNCATE TABLE users;"
  @connection.exec "INSERT INTO users (username, email, password) VALUES ('Debora38', 'debora@email.com', 'secretpassword')"
end
