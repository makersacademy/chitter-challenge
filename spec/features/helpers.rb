def setup_test_database
  connection = PG.connect dbname: 'chatter_test'
  connection.exec 'TRUNCATE chats'
end
