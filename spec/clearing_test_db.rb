require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE piepjes;")

  connection.exec("INSERT INTO piepjes (text, time, username)
  VALUES ('piepje1', '2020-06-06 11:10:25', 'someone'),
   ('piepje2', '2020-06-06 11:15:25', 'someone')")

end
