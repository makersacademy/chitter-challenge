def test_configure
  @connection = PG.connect( dbname: 'bookmark_manager_test')
  @connection.exec ( 'TRUNCATE TABLE peeps;')
  @connection.exec ("INSERT INTO peeps (peep) VALUES ('Hello there')")
  @connection.exec ("INSERT INTO peeps (peep) VALUES ('Another peep below)")
  @connection.exec ("INSERT INTO peeps (peep) VALUES ('This is a longer peep to see how it will be accepted in the test enviroment')")
end
