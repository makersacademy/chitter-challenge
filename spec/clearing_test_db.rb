require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'chitter_test')
  #clear the bookmarks table
  connection.exec("TRUNCATE peeps;")

  connection.exec("INSERT INTO peeps (text, time) VALUES ('peep1', '2020-06-06 11:10:25'),
   ('peep2', '2020-06-06 11:15:25')")

end
