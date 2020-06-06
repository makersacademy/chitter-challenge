require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")

  connection.exec("INSERT INTO peeps (text, time, username)
  VALUES ('peep1', '2020-06-06 11:10:25', 'someone'),
   ('peep2', '2020-06-06 11:15:25', 'someone')")

end
