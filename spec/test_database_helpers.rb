require 'pg'

def clean_peep
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("DELETE FROM peep")
end

def build_peep
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("INSERT INTO peep (message, posted_by) values('This is a peep created by the test database helper', 1);")
  conn.exec("INSERT INTO peep (message, posted_by) values('This is a second peep created by the test database helper', 1);")
end

def clean_maker
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("DELETE FROM maker where id <> 1")
end

def build_maker
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("INSERT INTO maker (name, user_name, email, password)
                      values('Joe Bloggs', 'joebloggs', 'joebloggs@gmail.com', 'password');")
end
