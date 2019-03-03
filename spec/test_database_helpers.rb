require 'pg'

def clean_database
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("DELETE FROM peep")
end

def build_database
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("INSERT INTO peep (message, posted_by) values('This is a peep created by the test database helper', 1);")
  conn.exec("INSERT INTO peep (message, posted_by) values('This is a second peep created by the test database helper', 1);")
end
